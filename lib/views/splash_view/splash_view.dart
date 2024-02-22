import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/utilities/general.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:awesome_wallpapers/views/common_components/button_component.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppTheme>().themeMode = ThemeMode.dark;
    //TODO: REMOVE THIS LINE AFTER TESTING

    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.appName,
              style: AppStyle.appBarTitleTextStyle.copyWith(color: context.theme.appColors.outline),
            ),
            SizedBox(
              height: 4.h,
            ),
            Expanded(
                flex: 6,
                child: SizedBox(
                    width: 100.w,
                    child: Image.asset(
                      AppAssets.splashBg,
                      fit: BoxFit.contain,
                    ))),
            SizedBox(
              height: 4.h,
            ),
            Text(
              AppString.appName,
              style: AppStyle.appBarTitleTextStyle.copyWith(color: context.theme.appColors.outline),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              AppString.appDescription,
              style: AppStyle.normalTextStyle.copyWith(color: context.theme.appColors.outline),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: CustomButton(
                onTap: () async {
                  // await locator.get<AuthService>().doFirebaseAnonymousLogin();
                  Navigator.pushReplacementNamed(context, NamedRoute.mainView, arguments: {'tabIndex': 0});
                },
                label: AppString.letsStart,
                hasIcon: true,
                width: 80.w,
                iconWidget: Icon(
                  Icons.arrow_forward,
                  color: AppColors.kWhiteColor,
                  size: 4.h,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppString.privacyPolicyText1,
                    style: AppStyle.normalTextStyle.copyWith(color: context.theme.appColors.outline),
                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: AppString.privacyPolicyText2,
                          recognizer: TapGestureRecognizer()..onTap = () => GeneralUtilities.launchURL(AppString.privacyPolicyLink),
                          style: AppStyle.normalTextStyle.copyWith(color: AppColors.kPrimaryLightColor)),
                      TextSpan(text: ' and ', style: AppStyle.normalTextStyle.copyWith(color: context.theme.appColors.outline)),
                      TextSpan(
                          text: AppString.privacyPolicyText3,
                          recognizer: TapGestureRecognizer()..onTap = () => GeneralUtilities.launchURL(AppString.privacyPolicyLink),
                          style: AppStyle.normalTextStyle.copyWith(color: AppColors.kPrimaryLightColor)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
