import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {}

class UnhandledFailure extends Failure {}

class ConnectionFailure extends Failure {}

class ServerFailure extends Failure {}
