import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../dto/food_dto.dart';

part 'nutri_suggest_api.g.dart';

@RestApi()
abstract class NutriSuggestApi {
  factory NutriSuggestApi(Dio dio, {String baseUrl}) = _NutriSuggestApi;

  @GET('recipes/findByNutrients')
  Future<List<FoodDto>> getFoodList();
}
