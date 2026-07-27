// import 'package:dartz/dartz.dart';
// import 'package:fruitify/core/errors/failure.dart';
// import 'package:fruitify/core/repos/orders_repo/orders_repo.dart';
// import 'package:fruitify/core/services/database_service.dart';
// import 'package:fruitify/core/utils/backend_endpoint.dart';

// class OrdersRepoImpl implements OrdersRepo {
//   final DatabaseService dataBaseService;

//   OrdersRepoImpl(this.dataBaseService);
//   @override
//   Future<Either<Failure, void>> addOrder(
//       {required OrderInputEntity order}) async {
//     try {
//       var orderModel = OrderModel.fromEntity(order);
//       await dataBaseService.addData(
//         path: BackendEndpoint.addOrder,
//         documentId: orderModel.orderId,
//         data: orderModel.toJson(),
//       );
//       return const Right(null);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
