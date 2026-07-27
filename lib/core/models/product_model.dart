import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/helper/get_avg_rating.dart';

import 'review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final num sellCount;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.avgRating,
    required this.unitAmount,
    required this.sellCount,
    required this.reviews,
    required this.price,
    required this.isOrganic,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviews = (json['reviews'] as List<dynamic>? ?? [])
        .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return ProductModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      sellCount: json['sell_count'] ?? 0,
      imageUrl: json['image_url'],
      expirationsMonths: json['expiration_months'] ?? 0,
      isOrganic: json['is_organic'] ?? false,
      numberOfCalories: json['number_of_calories'] ?? 0,
      unitAmount: json['unit_amount'] ?? 0,
      reviews: reviews,
      avgRating: getAvgRating(reviews),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'is_featured': isFeatured,
      'sell_count': sellCount,
      'image_url': imageUrl,
      'expiration_months': expirationsMonths,
      'number_of_calories': numberOfCalories,
      'unit_amount': unitAmount,
      'is_organic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
