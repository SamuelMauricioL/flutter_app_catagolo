part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesEventListCalled extends FavoritesEvent {}

class FavoritesEventProductRemoved extends FavoritesEvent {
  const FavoritesEventProductRemoved({required this.product});

  final ProductModel product;

  @override
  List<Object> get props => [product];
}
