import 'package:books_online/core/errors/error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Fialure, Type>> call([Param param]);
}
