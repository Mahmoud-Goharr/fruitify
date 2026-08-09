import 'package:dartz/dartz.dart';
import 'package:fruitify/core/errors/failure.dart';
import 'package:fruitify/features/profile/domain/entites/order_entity.dart';

 abstract class UserOrdersRepo {
 Future< Either<Failure,List<UserOrderEntity>>> fetchUserOrder();
}