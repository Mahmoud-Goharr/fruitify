import 'package:dartz/dartz.dart';
import 'package:fruitify/core/errors/failure.dart';
import 'package:fruitify/features/checkout/domain/entites/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});
}
