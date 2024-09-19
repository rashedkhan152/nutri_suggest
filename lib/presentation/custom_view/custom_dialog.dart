import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static void showLoadingDialog() {
    Get.dialog(
      const AlertDialog(
        content: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Please wait...'),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void showError(String message) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            Icon(Icons.error, size: 50, color: Colors.red[700]),
            const SizedBox(width: 20),
            const Text('Error'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog when the button is pressed
            },
            child: const Text('OK'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static void showWarning(String message) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning, size: 50, color: Colors.yellow[700]),
            const SizedBox(width: 20),
            const Text('Warning'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog when the button is pressed
            },
            child: const Text('OK'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static void showSuccess(String message) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            Icon(Icons.done, size: 50, color: Colors.green[700]),
            const SizedBox(width: 20),
            const Text('Success'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog when the button is pressed
            },
            child: const Text('OK'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
