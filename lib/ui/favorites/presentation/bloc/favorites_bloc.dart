import 'dart:async';

import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/favorites/data/repositories/favorites_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required this.repository,
  }) : super(FavoritesInitial()) {
    on<FavoritesEventListCalled>(_onFavoritesEventList);
    on<FavoritesEventProductRemoved>(_onFavoritesEventProductRemoved);
  }

  final FavoritesRepository repository;

  Future<void> _onFavoritesEventList(
    FavoritesEventListCalled event,
    Emitter emit,
  ) async {
    emit(FavoritesLoading());
    final products = await repository.getFavorites();
    products.when(
      ok: (list) {
        emit(FavoritesLoaded(list.reversed.toList()));
      },
      err: (error) {
        emit(
          const FavoritesError(
            message: 'Ocurrio un error al traer los favoritos',
          ),
        );
      },
    );
  }

  Future<void> _onFavoritesEventProductRemoved(
    FavoritesEventProductRemoved event,
    Emitter emit,
  ) async {
    emit(FavoritesLoading());
    // final removed = await repository.removeFavorite(event.product);
    // removed.when(
    //   ok: (_) {
    //     emit(FavoritesLoaded(state.products));
    //   },
    //   err: (error) {
    //     emit(
    //       const FavoritesError(
    //         message: 'Ocurrio un error al remover el producto',
    //       ),
    //     );
    //   },
    // );
  }
}
