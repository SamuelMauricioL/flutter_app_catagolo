part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailEventAddToFavorites extends DetailEvent {
  const DetailEventAddToFavorites(this.product);

  final ProductModel product;

  @override
  List<Object> get props => [product];
}
