import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/dependency_injection/dependency_injection.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/services/config_service.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:awesome_wallpapers/views/splash_view/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //   apiKey: "AIzaSyC8N5UJAFsfE9AZAkaKSxiR7GlVNpvHP2s",
  //   appId: "1:70765643948:android:28f1a1ce2ee08a338e7709",
  //   messagingSenderId: "70765643948",
  //   projectId: "wallpapers4klatest",
  // ));
  await Future.delayed(const Duration(seconds: 1))
      .whenComplete(() async => await ConfigService.configureAmplify());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeVM()),
  ], child: const MyApp()));

  ///enable this for testing...
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //     builder: (context) => MultiProvider(providers: [
  //           ChangeNotifierProvider(create: (context) => HomeVM()),
  //         ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
          // 1. Provide AppTheme above the MaterialApp, so it will be available on all pages.
          create: (_) => AppTheme(),
          builder: (context, _) => MaterialApp(
                navigatorKey: navigatorKey,
                builder: EasyLoading.init(),
                title: AppString.appName,
                // 2. Provide light theme.
                theme: AppTheme.light,
                // 3. Provide dark theme.
                darkTheme: AppTheme.dark,
                // 4. Watch AppTheme changes (ThemeMode).
                themeMode: context.watch<AppTheme>().themeMode,
                onGenerateRoute: AppRoutes.generateRoute,
                debugShowCheckedModeBanner: false,
                home: const SplashView(),
              ));
    });
  }
}
