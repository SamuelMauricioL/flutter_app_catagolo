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
    on<ProductEventDisableBottomBanner>(_onProductEventDisableBottomBanner);
    on<ProductEventSearchProduct>(_onProductEventSearchProduct);
    on<ProductEventSelectProduct>(_onProductEventSelectProduct);
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
        page: 1,
        products: [],
        hasNextPage: true,
        isLoadingMore: true,
        category: event.category,
      );
    } else {
      _productsLoaded = _productsLoaded.copyWith(isLoadingMore: true);
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

  Future<void> _onProductEventDisableBottomBanner(
    ProductEventDisableBottomBanner event,
    Emitter emit,
  ) async {
    if (!_productsLoaded.hasNextPage) {
      emit(ProductsLoading());
      _productsLoaded = _productsLoaded.copyWith(
        hasNextPage: true,
        isLoadingMore: false,
      );
      emit(_productsLoaded);
    }
  }

  Future<void> _onProductEventSearchProduct(
    ProductEventSearchProduct event,
    Emitter emit,
  ) async {
    emit(ProductsLoading());
    if (event.keyword.isNotEmpty) {
      final products = _productsLoaded.products
          .where(
            (p) => p.name.toLowerCase().contains(event.keyword.toLowerCase()),
          )
          .toList();
      emit(
        _productsLoaded.copyWith(
          products: products,
        ),
      );
    }
    if (event.keyword.isEmpty) {
      emit(_productsLoaded);
    }
  }

  Future<void> _onProductEventSelectProduct(
    ProductEventSelectProduct event,
    Emitter emit,
  ) async {
    emit(ProductsLoading());
    emit(
      _productsLoaded.copyWith(
        selectedProduct: event.product,
      ),
    );
  }
}
