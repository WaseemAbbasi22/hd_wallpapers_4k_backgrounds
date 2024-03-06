import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, themeProvider, child) {
      return Scaffold(
        body: BackgroundContainer(
          horizontalPadding: 1.w,
          verticalPadding: 0,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButtonComponent(
                    radius: 2.5.h,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(NamedRoute.splashView, (Route<dynamic> route) => false);
                    },
                  ),
                  const SizedBox(),
                ],
              ),
              const Spacer(),
              Lottie.asset(themeProvider.isDarkModeEnabled(context) ? AppAssets.noInternetDark : AppAssets.noInternetLight),
              // SizedBox(height: 3.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  AppString.noInternetConnectionTryAgain,
                  style: AppStyle.headingTextStyle.copyWith(color: context.theme.appColors.outline),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      );
    });
  }
}
