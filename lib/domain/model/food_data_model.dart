import 'package:json_annotation/json_annotation.dart';

part 'food_data_model.g.dart';

@JsonSerializable()
class FoodDataModel {
  final int? id;
  final String? title;
  final String? image;
  final String? imageType;
  final int? calories;
  final String? protein;
  final String? fat;
  final String? carbs;

  FoodDataModel({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
  });

  factory FoodDataModel.fromJson(Map<String, dynamic> json) => _$FoodDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodDataModelToJson(this);
}
