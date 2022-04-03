import 'package:app_catalogo/ui/products/data/repositories/products_repository.dart';
import 'package:app_catalogo/ui/products/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required this.repository,
  }) : super(ProductsInitial()) {
    on<ProductEventListCalled>(_onProductEventList);
    on<ProductEventListByCategoryCalled>(_onProductEventListByCategory);
  }

  final ProductsRepository repository;

  ProductsLoaded _productsLoaded = const ProductsLoaded();

  Future<void> _onProductEventList(
    ProductEventListCalled event,
    Emitter emit,
  ) async {
    emit(ProductsLoading());
    final products = await repository.getProductList();
    products.when(
      ok: (list) {
        _productsLoaded = _productsLoaded.copyWith(
          products: list.sublist(0, 5),
          categories: ProductModel.getCategories(list),
        );
        emit(_productsLoaded);
      },
      err: (error) {
        emit(
          const ProductsError(
            message: 'Ocurrio un error al traer los productos',
          ),
        );
      },
    );
  }

  Future<void> _onProductEventListByCategory(
    ProductEventListByCategoryCalled event,
    Emitter emit,
  ) async {
    emit(ProductsLoading());
    if (event.category != _productsLoaded.category) {
      _productsLoaded = _productsLoaded.copyWith(
        page: 2,
        products: [],
        hasNextPage: true,
        isLoadingMore: true,
        category: event.category,
      );
    } else {
      _productsLoaded = _productsLoaded.copyWith(
        isLoadingMore: true,
        category: event.category,
      );
    }
    emit(_productsLoaded);

    final products = await repository.getProductListByCategory(
      event.category,
      _productsLoaded.page,
    );

    products.when(
      ok: (list) {
        emit(ProductsLoading());
        _productsLoaded.products.addAll(list);
        _productsLoaded = _productsLoaded.copyWith(
          products: _productsLoaded.products,
          isLoadingMore: false,
          page: _productsLoaded.page + 1,
          hasNextPage: list.isNotEmpty,
        );
        emit(_productsLoaded);
      },
      err: (error) {
        emit(
          const ProductsError(
            message: 'Ocurrio un error al traer los productos',
          ),
        );
      },
    );
  }
}
