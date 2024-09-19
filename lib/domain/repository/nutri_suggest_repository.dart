import '../../util/resource.dart';
import '../model/food_data_model.dart';

abstract class NutriSuggestRepository {
  Stream<Resource<List<FoodDataModel>>> getFoodList(Map<String, String> headers);
}
