import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class Params extends Equatable {}

abstract class Usecase<Failure, T> {
  Future<Either<Failure, T>> call(Params? params);
}
