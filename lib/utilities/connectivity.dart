import 'dart:async';

import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/common_components/user_intimation_components.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityUtil {
  static Future<bool> checkInternetConnectivity({required Function() onNoInternetFound}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      onNoInternetFound();
      return false;
    }

    return false;
  }

  static late StreamSubscription<ConnectivityResult> networkSubscription;

  static void subscribeToConnectivityChange({required Function() onNoInternetFound}) {
    bool isRenew = false;

    networkSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isRenew = true;
        UserIntimationComponents.showToast(AppString.noInternetConnection);
        onNoInternetFound();
      } else if ((result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) && isRenew == true) {
        isRenew = false;
        UserIntimationComponents.showToast(AppString.internetRestored);
      }
    });
  }
}
