import 'dart:async';

import 'package:awesome_wallpapers/views/common_components/user_intimation_components.dart';
import 'package:awesome_wallpapers/views/main_view/main_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  ErrorScreenState createState() => ErrorScreenState();
}

class ErrorScreenState extends State<ErrorScreen> {
  late StreamSubscription<ConnectivityResult> networkSubscription;

  @override
  void initState() {
    super.initState();

    networkSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if ((result == ConnectivityResult.mobile || result == ConnectivityResult.wifi)) {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (BuildContext context) => const MainView()));

        UserIntimationComponents.showToast('Your Connection was Restored.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Check your internet please, we will udoate this screen later"),
    );
    // print('Error Screen');
    // SizeConfig().init(context);
    // var screenHeight = SizeConfig.screenHeight;
    // var screenWidth = SizeConfig.screenWidth;
    // return Scaffold(
    //   appBar: AppBar(
    //     elevation: 0.0,
    //     centerTitle: true,
    //     backgroundColor: AppColors.kGifBgColor,
    //     title: Text(
    //       AppStrings.appName,
    //       style: TextStyle(
    //         color: AppColors.kWhiteColor,
    //         fontFamily: 'WorkSans',
    //         fontWeight: FontWeight.bold,
    //         fontSize: screenHeight * 0.03,
    //       ),
    //     ),
    //   ),
    //   body: Container(
    //     color: AppColors.kGifBgColor,
    //     height: SizeConfig.screenHeight,
    //     width: SizeConfig.screenWidth,
    //     child: Column(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           height: screenHeight * 0.05,
    //         ),
    //         Center(
    //           child: Container(
    //             margin: EdgeInsets.all(screenHeight * 0.01),
    //             child: Image.asset(
    //               'assets/no_internet.gif',
    //               fit: BoxFit.fill,
    //             ),
    //           ),
    //         ),
    //         Text(
    //           '\nPlease connect to the Internet',
    //           style: TextStyle(
    //             fontSize: screenHeight * 0.025,
    //             color: AppColors.kWhiteColor,
    //             fontFamily: 'WorkSans',
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
