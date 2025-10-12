import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppPageChangedTo>(_onPageChangedTo);
  }

  void _onPageChangedTo(
    AppPageChangedTo event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        pageStatus: event.page,
      ),
    );
  }
}
