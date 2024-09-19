import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/model/food_data_model.dart';

part 'food_dto.g.dart';

@JsonSerializable()
class FoodDto {
  final int? id;
  final String? title;
  final String? image;
  final String? imageType;
  final int? calories;
  final String? protein;
  final String? fat;
  final String? carbs;

  FoodDto({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
  });

  factory FoodDto.fromJson(Map<String, dynamic> json) => _$FoodDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FoodDtoToJson(this);

  FoodDataModel toFoodDataModel() {
    return FoodDataModel(
      id: id,
      title: title,
      image: image,
      imageType: imageType,
      calories: calories,
      protein: protein,
      fat: fat,
      carbs: carbs,
    );
  }
}
