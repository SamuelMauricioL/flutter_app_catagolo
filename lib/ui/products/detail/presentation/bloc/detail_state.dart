part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();
  
  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}
