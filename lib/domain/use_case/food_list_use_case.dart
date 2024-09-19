import '../../util/resource.dart';
import '../model/food_data_model.dart';
import '../repository/nutri_suggest_repository.dart';

class FoodListUseCase {
  final NutriSuggestRepository _nutriSuggestRepository;

  FoodListUseCase(this._nutriSuggestRepository);

  Stream<Resource<List<FoodDataModel>>> call(Map<String, String> headers) async* {
    yield* _nutriSuggestRepository.getFoodList(headers);
  }
}
