import 'package:json_annotation/json_annotation.dart';

part 'product_class.g.dart';

@JsonSerializable()
class Product {
  final String name;
  final String price;
  final String quantity;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
