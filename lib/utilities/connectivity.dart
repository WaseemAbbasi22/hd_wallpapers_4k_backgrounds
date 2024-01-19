import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityService {
  static Future<bool> checkInternetConnectivity(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    //  TODO: HANDLE
    if (connectivityResult == ConnectivityResult.mobile) {
      //  TODO: HANDLE
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //  TODO: HANDLE
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      //  TODO: HANDLE
      //Navigate to Error View

      return false;
    }

    return false;
  }
}
