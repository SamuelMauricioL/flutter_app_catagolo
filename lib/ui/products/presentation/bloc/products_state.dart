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
    required this.products,
  });

  final List<ProductModel> products;

  @override
  List<Object> get props => [products];
}

class ProductsError extends ProductsState {
  const ProductsError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
