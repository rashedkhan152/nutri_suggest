import 'package:dio/dio.dart';

import '../constant/api_urls.dart';
import '../data/datasource/api/nutri_suggest_api.dart';
import '../data/repository/nutri_suggest_repository_impl.dart';
import '../domain/repository/nutri_suggest_repository.dart';
import '../domain/use_case/food_list_use_case.dart';
import '../domain/use_case/nutri_suggest_use_cases.dart';
import '../main.dart';

abstract class NutriSuggestModule {
  static void dependencies() {
    // Register Dio
    getIt.registerLazySingleton<Dio>(() => Dio());

    // Register NutriSuggestApi
    getIt.registerLazySingleton<NutriSuggestApi>(
      () => NutriSuggestApi(getIt<Dio>(), baseUrl: ApiUrls.baseUrl),
    );

    // Register NutriSuggestRepository
    getIt.registerLazySingleton<NutriSuggestRepository>(
      () => NutriSuggestRepositoryImpl(getIt<NutriSuggestApi>()),
    );

    // Register NutriSuggestUseCases
    getIt.registerLazySingleton<NutriSuggestUseCases>(
      () => NutriSuggestUseCases(
        foodListUseCase: FoodListUseCase(getIt<NutriSuggestRepository>()),
      ),
    );
  }
}
