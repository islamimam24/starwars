import 'package:dartz/dartz.dart';
import 'package:starwars/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultFutureVoid = Future<Either<Failure, void>>;
typedef DataMap = Map<String, dynamic>;
typedef StringCallback = void Function(String val);
