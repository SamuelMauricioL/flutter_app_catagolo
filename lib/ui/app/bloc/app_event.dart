part of 'app_bloc.dart';

//TODO: VERIFICAR COMO TESTEAR EL OVERRIDE
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppPageChangedTo extends AppEvent {
  const AppPageChangedTo({
    required this.page,
  });

  final AppPageStatus page;

  @override
  List<Object?> get props => [];
}
