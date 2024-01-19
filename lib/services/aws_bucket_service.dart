import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:awesome_wallpapers/amplifyconfiguration.dart';

class AmplifyServices {
  static Future<void> configureAmplify() async {
    AmplifyAuthCognito amplifyAuthCognito = AmplifyAuthCognito();
    AmplifyStorageS3 amplifyStorageS3 = AmplifyStorageS3();
    List<AmplifyPluginInterface> plugins = [amplifyAuthCognito, amplifyStorageS3];
    if (!Amplify.isConfigured) {
      Amplify.addPlugins(plugins);

      try {
        await Amplify.configure(amplifyconfig);
      } on AmplifyAlreadyConfiguredException {
        print("Amplify was already configured. Was the app restarted?");
      }
    } else {
      print("Amplify was already configured. So I am not configuring it again!");
    }
  }
}
