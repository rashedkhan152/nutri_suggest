import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/strings.dart';
import '../controller/login_controller.dart';
import '../controller/nutri_suggest_controller.dart';
import '../custom_view/custom_app_bar.dart';
import '../custom_view/custom_buttons.dart';
import 'login_screen.dart';

class BasicInfoScreen extends StatelessWidget {
  final String userName;
  final String userImage;

  BasicInfoScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  final _c = Get.put(NutriSuggestController());
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: Strings.basicInfo,
        onBackPressed: SystemNavigator.pop,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(75.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(userImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    'Hello,\n$userName!',
                    style: GoogleFonts.acme(fontSize: 24.0),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'What is your height?',
                      style: GoogleFonts.acme(fontSize: 24.0),
                    ),
                    const SizedBox(height: 40.0),
                    Obx(
                      () => SizedBox(
                        child: TextFormField(
                          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                          onTap: _c.selectedUnit.value == HeightUnit.ft
                              ? () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 200,
                                        color: Colors.grey,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: CupertinoPicker(
                                                itemExtent: 32.0,
                                                onSelectedItemChanged: (int index) {
                                                  debugPrint('${index + 1}');
                                                  _c.ft.value = (index + 1);
                                                  _c.heightController.value.text = "${_c.ft.value}' ${_c.inches.value}\"";
                                                },
                                                children: List.generate(12, (index) {
                                                  return Center(
                                                    child: Text(
                                                      '${index + 1}',
                                                      style: const TextStyle(fontSize: 24.0),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                            const Expanded(
                                              child: Center(
                                                child: Text(
                                                  'ft',
                                                  style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: CupertinoPicker(
                                                itemExtent: 32.0,
                                                onSelectedItemChanged: (int index) {
                                                  debugPrint('$index');
                                                  _c.inches.value = (index);
                                                  _c.heightController.value.text = "${_c.ft.value}' ${_c.inches.value}\"";
                                                },
                                                children: List.generate(12, (index) {
                                                  return Center(
                                                    child: Text(
                                                      '$index',
                                                      style: const TextStyle(fontSize: 24.0),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                            const Expanded(
                                              flex: 3,
                                              child: Center(
                                                child: Text(
                                                  'inches',
                                                  style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              : null,
                          controller: _c.heightController.value,
                          onChanged: (height) {
                            if (_c.selectedUnit.value == HeightUnit.cm) {
                              _c.cm.value = double.parse(height);
                              debugPrint('${_c.cm.value}');
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xFF4C4ED7),
                          decoration: InputDecoration(
                            hintText: _c.selectedUnit.value == HeightUnit.ft ? "__' __\"" : '__',
                            hintStyle: const TextStyle(
                              color: Color(0xFF4C4ED7),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF7401),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF7401),
                              ),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9.]"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                if (_c.heightController.value.text.isEmpty) {
                                  _c.selectedUnit.value = HeightUnit.ft;
                                } else {
                                  _c.selectedUnit.value = HeightUnit.ft;
                                  _c.checkHeightUnit();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: _c.selectedUnit.value == HeightUnit.ft ? const Color(0xFFFF7401) : Colors.transparent,
                                  ),
                                  color: Colors.transparent,
                                ),
                                width: 80,
                                height: 80,
                                child: const Center(
                                  child: Text(
                                    'ft',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                if (_c.heightController.value.text.isEmpty) {
                                  _c.selectedUnit.value = HeightUnit.cm;
                                } else {
                                  _c.selectedUnit.value = HeightUnit.cm;
                                  _c.checkHeightUnit();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: _c.selectedUnit.value == HeightUnit.cm ? const Color(0xFFFF7401) : Colors.transparent,
                                  ),
                                  color: Colors.transparent,
                                ),
                                width: 80,
                                height: 80,
                                child: const Center(
                                  child: Text(
                                    'cm',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Text(
                      'What is your weight (kg)?',
                      style: GoogleFonts.acme(fontSize: 24.0),
                    ),
                    const SizedBox(height: 20.0),
                    Obx(
                      () => SizedBox(
                        child: TextFormField(
                          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                          controller: _c.weightController.value,
                          onChanged: (weight) {
                            _c.kg.value = double.parse(weight);
                            debugPrint('${_c.kg.value}');
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xFF4C4ED7),
                          decoration: const InputDecoration(
                            hintText: '__',
                            hintStyle: TextStyle(
                              color: Color(0xFF4C4ED7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF7401),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF7401),
                              ),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomElevatedButton(
                        onPressed: () => _c.validate(),
                        buttonText: Strings.proceed.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
