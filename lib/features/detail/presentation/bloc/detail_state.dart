part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {}

class DetailError extends DetailState {
  const DetailError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
