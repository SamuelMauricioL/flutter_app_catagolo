part of 'app_bloc.dart';

enum AppPageStatus {
  home,
  traking,
  profile,
}

class AppState extends Equatable {
  const AppState({
    this.pageStatus = AppPageStatus.home,
  });

  final AppPageStatus pageStatus;

  AppState copyWith({
    AppPageStatus? pageStatus,
  }) {
    return AppState(
      pageStatus: pageStatus ?? this.pageStatus,
    );
  }

  @override
  List<Object> get props => [
        pageStatus,
      ];
}
