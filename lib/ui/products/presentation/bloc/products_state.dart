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
  });

  final List<ProductModel> products;
  final List<String> categories;
  final String category;

  ProductsLoaded copyWith({
    List<ProductModel>? products,
    List<String>? categories,
    String? category,
  }) {
    return ProductsLoaded(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      category: category ?? this.category,
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
