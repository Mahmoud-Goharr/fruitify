import 'package:dartz/dartz.dart';
import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/errors/failure.dart';
import 'package:fruitify/core/models/product_model.dart';
import 'package:fruitify/core/repos/products_repo/products_repo.dart';
import 'package:fruitify/core/services/database_service.dart';
import 'package:fruitify/core/utils/backend_endpoint.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sell_count',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
