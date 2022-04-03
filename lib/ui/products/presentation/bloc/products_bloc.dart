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
  ProductsLoaded get productsLoaded => _productsLoaded;

  Future<void> _onProductEventList(
    ProductEventListCalled event,
    Emitter emit,
  ) async {
    emit(ProductsLoading());
    final products = await repository.getProductList();
    products.when(
      ok: (list) {
        _productsLoaded = _productsLoaded.copyWith(
          products: list,
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
    final products = await repository.getProductListByCategory(event.category);
    products.when(
      ok: (list) {
        emit(
          _productsLoaded.copyWith(
            products: list,
          ),
        );
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
