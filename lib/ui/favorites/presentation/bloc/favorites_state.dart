part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded(this.products);

  final List<ProductModel> products;

  @override
  List<Object> get props => [products];
}

class FavoritesError extends FavoritesState {
  const FavoritesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
