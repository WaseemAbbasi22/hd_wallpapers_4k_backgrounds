import 'package:in_app_update/in_app_update.dart';

class InAppUpdateUtil {
  static void performImmediateUpdate() {
    InAppUpdate.checkForUpdate().then((info) {
      UpdateAvailability updateAvailability = info.updateAvailability;

      if (updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().catchError(
          (e) {
            // log("error in performImmediateUpdate : ${e.toString()}");
            return AppUpdateResult.inAppUpdateFailed;
          },
        );
      } else {
        // log("No Need to Update!");
      }
    }).onError((error, stackTrace) {
      // log("error in checkForUpdate: ${error.toString()}");
    });
  }
}
