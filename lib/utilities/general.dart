import 'dart:math';

import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralUtilities {
  static void launchURL(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  static void shareMyApp() async {
    await Share.share(
        'Hey, Check out this Amazing Applications which offers you unlimited 4k Wallpapers with categories_popular at one place.  ${"AppStrings.playStoreLink"}');
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
}
