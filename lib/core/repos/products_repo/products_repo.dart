import 'package:dartz/dartz.dart';
import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
