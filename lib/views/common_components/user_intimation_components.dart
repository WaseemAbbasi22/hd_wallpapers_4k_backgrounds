import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserIntimationComponents {
  static void showToast(dynamic value, {int? forSeconds}) {
    EasyLoading.showToast(
      value,
      toastPosition: EasyLoadingToastPosition.bottom,
      duration: Duration(seconds: forSeconds ?? 1),
    );
  }

  static getLoader(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          );
        });
  }
}
