import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constant/food_data.dart';
import '../../constant/header_data.dart';
import '../../domain/model/food_data_model.dart';
import '../../domain/use_case/nutri_suggest_use_cases.dart';
import '../../main.dart';
import '../../util/global_variables.dart';
import '../../util/resource.dart';
import '../custom_view/custom_dialog.dart';
import '../view/more_info_screen.dart';
import '../view/suggestion_screen.dart';

enum HeightUnit { ft, cm }

class NutriSuggestController extends GetxController {
  final _nutriSuggestUseCases = getIt<NutriSuggestUseCases>();

  var selectedUnit = HeightUnit.ft.obs; // Observable

  var heightController = TextEditingController().obs;
  var weightController = TextEditingController().obs;

  var ft = 0.obs;
  var inches = 0.obs;
  var cm = 0.0.obs;

  var kg = 0.0.obs;

  var foodList = GlobalVariables.foodList;

  final _isLoading = false.obs;

  void toggleLoading(bool value) {
    if (value) {
      CustomDialog.showLoadingDialog();
    } else {
      Get.back();
    }
    _isLoading.value = value;
  }

  cmToInches(int inch) {
    ft.value = inch ~/ 12;
    inches.value = inch % 12;
    debugPrint('$ft feet and ${inches.value} inches');
  }

  inchesToCm() {
    int inchesTotal = (ft.value * 12) + inches.value;
    cm.value = (inchesTotal * 2.54);
    heightController.value.text = cm.toString();
  }

  void checkHeightUnit() {
    if (selectedUnit.value == HeightUnit.ft) {
      int inch = (double.parse(heightController.value.text) ~/ 2.54).toInt();
      cmToInches(inch);
      heightController.value.text = '$ft\' ${inches.value}"';
    } else if (selectedUnit.value == HeightUnit.cm) {
      debugPrint(heightController.value.text);
      inchesToCm();
    }
  }

  void validate() {
    if (selectedUnit.value == HeightUnit.ft) {
      if (ft.value == 0) {
        CustomDialog.showWarning('Please select your height in ft');
      } else if (ft.value < 3) {
        CustomDialog.showWarning('Height below 3 ft is abnormal');
      } else if (kg.value == 0) {
        CustomDialog.showWarning('Please select your weight');
      } else if (kg.value < 25) {
        CustomDialog.showWarning('Weight below 25 kg is abnormal');
      } else {
        Get.to(() => MoreInfoScreen());
      }
    } else if (selectedUnit.value == HeightUnit.cm) {
      if (cm.value == 0) {
        CustomDialog.showWarning('Please select your height in cm');
      } else if (cm.value < 91.44) {
        CustomDialog.showWarning('Height below 91.44 cm is abnormal');
      } else if (kg.value == 0) {
        CustomDialog.showWarning('Please select your weight');
      } else if (kg.value < 25) {
        CustomDialog.showWarning('Weight below 25 kg is abnormal');
      } else {
        Get.to(() => MoreInfoScreen());
      }
    }
  }

  void getFoodList() {
    _nutriSuggestUseCases.foodListUseCase(HeaderData.header).listen((resource) {
      switch (resource.status) {
        case Status.loading:
          toggleLoading(true);
          break;
        case Status.success:
          toggleLoading(false);
          foodList.assignAll(resource.data!);
          GlobalVariables.foodList.assignAll(resource.data!);
          Get.to(() => SuggestionScreen());
          break;
        case Status.error:
          toggleLoading(false);
          if (resource.errorCode == 403) {
            foodList.assignAll(FoodData.foodList.map((item) => FoodDataModel.fromJson(item)).toList());
            GlobalVariables.foodList.assignAll(FoodData.foodList.map((item) => FoodDataModel.fromJson(item)).toList());
            Get.to(() => SuggestionScreen());
          } else {
            CustomDialog.showError('${resource.errorMessage}');
          }
          break;
      }
    });
  }
}
