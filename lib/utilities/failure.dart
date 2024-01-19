import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class ConnectivityFailure extends Failure {
  const ConnectivityFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class DuplicateUsername extends Failure {
  const DuplicateUsername({String? message}) : super(message ?? '');

  @override
  List<Object?> get props => [message];
}

class InvalidCredentials extends Failure {
  const InvalidCredentials({String? message}) : super(message ?? '');

  @override
  List<Object?> get props => [message];
}
