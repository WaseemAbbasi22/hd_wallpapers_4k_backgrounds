import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:awesome_wallpapers/views/common_components/user_intimation_components.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/services.dart';

abstract class AuthService {
  Future<void> doFirebaseAnonymousLogin();

  Future<void> refreshAWSAuthSession();
}

class AuthServiceImp implements AuthService {
  var platform = const MethodChannel('flutter.native/helper');

  Future<void> socialSignIn(String token) async {
    try {
      final result = await Amplify.Auth.signInWithWebUI(
        provider: AuthProvider.oidc("securetoken.google.com/wallpapers4klatest", token),
      );
      safePrint('Sign in result: $result');
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }

  @override
  Future doFirebaseAnonymousLogin() async {
    firebase.FirebaseAuth auth = firebase.FirebaseAuth.instance;

    await auth.signInAnonymously().then((value) async {
      log('This is token from sign in Result: ${await value.user!.getIdToken()}');
      await socialSignIn(await value.user!.getIdToken() ?? "");
      // await sendTokenToNative(await value.user!.getIdToken() ?? "").then((value) => {
      //       log('I am result from Native: $value '),
      //     });
    });
  }

  Future<String> sendTokenToNative(String token) async {
    String value = '';
    try {
      value = await platform.invokeMethod("sendIDToAWSFromNative", {"id": token});
    } catch (e) {
      log('I am exception in sendTokenToNative: $e');
    }

    return value;
  }

  @override
  Future refreshAWSAuthSession() async {
    try {
      AuthSession response = await Amplify.Auth.fetchAuthSession(options: const FetchAuthSessionOptions(forceRefresh: true));

      log('I am session response: ${response.isSignedIn}');
    } on AuthException catch (e) {
      // if (EasyLoading.isShow) EasyLoading.dismiss();
      UserIntimationComponents.showToast("Error: $e");
      log('I am auth exception in refreshAWSAuthSession: $e');
    }
    // var firebaseUser = FirebaseAuth.instance.currentUser;
    // var token = await firebaseUser?.getIdToken();
    //
    // if (token != null) {
    //   await sendTokenToNative(token).then((value) {
    //     return value;
    //   });
    // }
  }
}
