import 'package:dartz/dartz.dart';
import 'package:fruitify/core/errors/failure.dart';
import 'package:fruitify/core/services/database_service.dart';
import 'package:fruitify/core/utils/backend_endpoint.dart';
import 'package:fruitify/features/profile/data/model/order_model.dart';
import 'package:fruitify/features/profile/domain/entites/order_entity.dart';
import 'package:fruitify/features/profile/domain/repos/user_orders_repo.dart';

class UserOrdersRepoImpl implements UserOrdersRepo {
  final DatabaseService _databaseService;

  UserOrdersRepoImpl(this._databaseService);

  @override
  Future<Either<Failure, List<UserOrderEntity>>> fetchUserOrder() async {
    try {
      final data = await _databaseService.getData(
        path: BackendEndpoint.getOrders,
      );

      final orders = (data as List<dynamic>)
          .map((e) => UserOrderModel.fromJson(e).toEntity())
          .toList();

      return right(orders);
    } catch (e) {
      return left(
        ServerFailure('Failed to fetch user orders'),
      );
    }
  }
}