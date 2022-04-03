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
    this.category = CATEGORY_ALL,
    this.isLoadMore = false,
    this.page = 2,
    this.hasPage = true,
  });

  final List<ProductModel> products;
  final List<String> categories;
  final String category;
  final bool isLoadMore;
  final int page;
  final bool hasPage;

  ProductsLoaded copyWith({
    List<ProductModel>? products,
    List<String>? categories,
    String? category,
    bool? isLoadMore,
    int? page,
    bool? hasPage,
  }) {
    return ProductsLoaded(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      category: category ?? this.category,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      page: page ?? this.page,
      hasPage: hasPage ?? this.hasPage,
    );
  }

  @override
  List<Object> get props => [products, categories, category];
}

class ProductsError extends ProductsState {
  const ProductsError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
