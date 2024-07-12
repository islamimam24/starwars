import 'package:equatable/equatable.dart';
import 'package:starwars/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;
  String get errorMessages => "$statusCode Error: $message";

  const Failure({required this.message, required this.statusCode});

  /// in order to make the failure is another failure but the message and the status code are the same

  @override
  List<Object> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});

  APIFailure.fromException(APIException exception) : this(message: exception.message, statusCode: exception.statusCode);
}
