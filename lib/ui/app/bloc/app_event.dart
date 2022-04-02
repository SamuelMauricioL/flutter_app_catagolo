part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppPageChangedTo extends AppEvent {
  const AppPageChangedTo({
    required this.page,
  });

  final AppPageStatus page;
}
