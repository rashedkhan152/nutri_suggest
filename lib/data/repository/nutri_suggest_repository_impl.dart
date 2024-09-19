import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/food_data_model.dart';
import '../../domain/repository/nutri_suggest_repository.dart';
import '../../main.dart';
import '../../util/exception_util.dart';
import '../../util/resource.dart';
import '../datasource/api/nutri_suggest_api.dart';

class NutriSuggestRepositoryImpl implements NutriSuggestRepository {
  final NutriSuggestApi _nutriSuggestApi;

  NutriSuggestRepositoryImpl(this._nutriSuggestApi);

  @override
  Stream<Resource<List<FoodDataModel>>> getFoodList(Map<String, String> headers) async* {
    getIt<Dio>().options.headers = headers;

    try {
      yield Resource.loading();
      final response = await _nutriSuggestApi.getFoodList();
      List<Map<String, dynamic>> jsonList = response.map((food) => food.toJson()).toList();
      debugPrint('FoodList response: ${jsonList.toString()}');
      yield Resource.success(response.map((food) => food.toFoodDataModel()).toList());
    } on DioException catch (e) {
      debugPrint('FoodList error: $e');
      yield ExceptionUtil.handleDioException<List<FoodDataModel>>(e);
    }
  }
}
