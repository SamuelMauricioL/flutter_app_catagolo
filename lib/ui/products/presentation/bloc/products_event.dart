part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductEventListCalled extends ProductsEvent {}

class ProductEventListByCategoryCalled extends ProductsEvent {
  const ProductEventListByCategoryCalled({
    required this.category,
  });

  final String category;

  @override
  List<Object> get props => [category];
}

class ProductEventDisableBottomBanner extends ProductsEvent {}

class ProductEventSearchProduct extends ProductsEvent {
  const ProductEventSearchProduct(this.keyword);

  final String keyword;

  @override
  List<Object> get props => [keyword];
}
