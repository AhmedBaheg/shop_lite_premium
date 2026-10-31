import 'package:hive/hive.dart';

import '../../domain/entities/product_entity.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final double? rating;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? category;
  @HiveField(6)
  final int? reviews;
  @HiveField(7)
  final int? id;

  const ProductModel({
    this.image,
    this.title,
    this.price,
    this.rating,
    this.description,
    this.category,
    this.reviews,
    this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['thumbnail'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      reviews: json['reviews'] is List
          ? (json['reviews'] as List).length
          : (json['reviews'] ?? 0),
      id: json['id'] as int?,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      image: entity.image,
      title: entity.title,
      price: entity.price,
      rating: entity.rating,
      description: entity.description,
      category: entity.category,
      reviews: entity.reviews,
      id: entity.id,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      image: image,
      title: title,
      price: price,
      rating: rating,
      description: description,
      category: category,
      reviews: reviews,
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': image,
      'title': title,
      'price': price,
      'rating': rating,
      'description': description,
      'category': category,
      'reviews': reviews,
      'id': id,
    };
  }
}
