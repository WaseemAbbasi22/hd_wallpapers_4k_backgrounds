import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/common_components/user_intimation_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralUtilities {
  static void launchURL(String _url) async {
    try {
      await launchUrl(Uri.parse(_url));
    } on PlatformException {
      await launchUrl(Uri.parse(_url));
    }
  }

  static Future<void> shareMyApp() async {
    await Share.share(
        'Hey, Check out this Amazing Applications which offers you unlimited 4k Wallpapers with Trending Collections at one place. ${AppString.playStoreLink}');
  }

  static int getRandomNumber(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  static String getFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(0)} ${suffixes[i]}';
  }

  static downloadImageFromLink({required String url, required BuildContext context}) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    int now = DateTime.now().millisecondsSinceEpoch;
    final fileName = now.toString();

    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getDownloadsDirectory();

      if (dir == null) {
        return;
      }
      // Create an image name
      var filename = '${dir.path}/${fileName}_image.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Wallpaper Saved Successfully.';
      }
    } catch (e) {
      dev.log("err: ${e.toString()}");
      message = 'An error occurred while saving the image';
    }

    if (message != null) {
      UserIntimationComponents.showToast(message);
    }
  }

  static Future<void> setWallpaper({required String url, required int wallpaperLocation}) async {
    // static const int HOME_SCREEN = 1;
    // static const int LOCK_SCREEN = 2;
    // static const int BOTH_SCREENS = 3;

    String result = "";
    try {
      result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: wallpaperLocation,
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper Set'
          : 'Failed to get wallpaper.';
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
    UserIntimationComponents.showToast(result);
  }

  static Future<void> shareWallpaper({required String url}) async {
    int now = DateTime.now().millisecondsSinceEpoch;
    final fileName = now.toString();

    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/${fileName}_image.png';

      // Save to filesystem
      final file = File(filename);
      file.writeAsBytesSync(response.bodyBytes);
      await Share.shareXFiles([XFile(file.path)],
          subject: AppString.appName,
          text:
              'Hey, Check out this Amazing wallpaper that I found on this Amazing Free application ${AppString.appName} \n Download it now from PlayStore: ${AppString.playStoreLink}');
    } catch (e) {
      dev.log("err: ${e.toString()}");
      UserIntimationComponents.showToast("An error occurred while sharing the image'");
    }
  }
}
