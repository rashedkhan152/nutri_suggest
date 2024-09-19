// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodDataModel _$FoodDataModelFromJson(Map<String, dynamic> json) =>
    FoodDataModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      imageType: json['imageType'] as String?,
      calories: (json['calories'] as num?)?.toInt(),
      protein: json['protein'] as String?,
      fat: json['fat'] as String?,
      carbs: json['carbs'] as String?,
    );

Map<String, dynamic> _$FoodDataModelToJson(FoodDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'imageType': instance.imageType,
      'calories': instance.calories,
      'protein': instance.protein,
      'fat': instance.fat,
      'carbs': instance.carbs,
    };
