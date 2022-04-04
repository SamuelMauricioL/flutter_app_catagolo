import 'dart:async';

import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/products/detail/data/repositories/detail_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({
    required this.repository,
  }) : super(DetailInitial()) {
    on<DetailEventAddToFavorites>(_onDetailEventAddToFavorites);
  }

  final DetailRepository repository;

  Future<void> _onDetailEventAddToFavorites(
    DetailEventAddToFavorites event,
    Emitter emit,
  ) async {
    emit(DetailLoading());
    final product = await repository.addToFavorites(event.product);
    product.when(
      ok: (product) {
        emit(DetailLoaded());
      },
      err: (error) {
        emit(
          const DetailError(
            message: 'Ocurrio un error al agregar el producto a favoritos',
          ),
        );
      },
    );
  }
}
