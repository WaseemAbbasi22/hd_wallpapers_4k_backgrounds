import 'package:flutter_easyloading/flutter_easyloading.dart';

class UserIntimationComponents {
  static void showToast(dynamic value) {
    EasyLoading.showToast(
      value,
      toastPosition: EasyLoadingToastPosition.bottom,
      duration: const Duration(seconds: 1),
    );
  }
}
