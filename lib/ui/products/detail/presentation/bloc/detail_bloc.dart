import 'dart:async';

import 'package:app_catalogo/core/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailEventAddToFavorites>(_onDetailEventAddToFavorites);
  }

  Future<void> _onDetailEventAddToFavorites(
    DetailEventAddToFavorites event,
    Emitter emit,
  ) async {
    emit(DetailLoading());
    // await Future.delayed(Duration(seconds: 1));
    emit(DetailLoaded());
  }
}
