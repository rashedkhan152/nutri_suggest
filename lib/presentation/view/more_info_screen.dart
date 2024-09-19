import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/food_data.dart';
import '../../constant/strings.dart';
import '../controller/login_controller.dart';
import '../controller/nutri_suggest_controller.dart';
import '../custom_view/custom_app_bar.dart';
import 'login_screen.dart';

class MoreInfoScreen extends StatelessWidget {
  MoreInfoScreen({super.key});

  final _c = Get.put(NutriSuggestController());
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: Strings.moreInfo,
        actions: [
          IconButton(
            icon: const SizedBox(
              height: 25.0,
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              await _loginController.signOut();
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Are you allergic to any of these?',
              style: GoogleFonts.acme(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'We need to know more about you. Please tap on the items to select.',
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: FilterListWidget<String>(
                  listData: FoodData.foodItems,
                  selectedListData: FoodData.selectedItems,
                  hideSearchField: true,
                  onApplyButtonClick: (list) {
                    FoodData.selectedItems = List.from(list ?? []);
                    _c.getFoodList();
                  },
                  choiceChipLabel: (item) => item,
                  validateSelectedItem: (list, val) => list!.contains(val),
                  onItemSearch: (list, text) {
                    return list.toLowerCase().contains(text.toLowerCase());
                  },
                  allButtonText: 'All'.toUpperCase(),
                  resetButtonText: 'Reset'.toUpperCase(),
                  applyButtonText: 'Apply'.toUpperCase(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
