import 'package:equatable/equatable.dart';

/// as an Exception model

class APIException extends Equatable {
  // to able to equate if an exception is the same as another exception
  final String message;
  final int statusCode;

  const APIException({required this.message, required this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}
