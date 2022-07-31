part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  const ProductsLoaded({
    this.products = const [],
    this.categories = const [],
    this.categorySelected = CATEGORY_ALL,
    this.isLoadingMore = false,
    this.page = 2,
    this.hasNextPage = true,
    this.selectedProduct,
  });

  final List<ProductModel> products;
  final List<String> categories;
  final String categorySelected;
  final bool isLoadingMore;
  final int page;
  final bool hasNextPage;
  final ProductModel? selectedProduct;

  ProductsLoaded copyWith({
    List<ProductModel>? products,
    List<String>? categories,
    String? categorySelected,
    bool? isLoadingMore,
    int? page,
    bool? hasNextPage,
    ProductModel? selectedProduct,
  }) {
    return ProductsLoaded(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      categorySelected: categorySelected ?? this.categorySelected,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      selectedProduct: selectedProduct ?? this.selectedProduct,
    );
  }

  @override
  List<Object> get props => [products, categories, categorySelected];
}

class ProductsError extends ProductsState {
  const ProductsError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
