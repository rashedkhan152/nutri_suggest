import 'package:get/get.dart';

import '../domain/model/food_data_model.dart';

abstract class GlobalVariables extends GetxService {
  static var foodList = <FoodDataModel>[].obs;
}
