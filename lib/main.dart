import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/dependency_injection/dependency_injection.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/services/config_service.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:awesome_wallpapers/views/splash_view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyC8N5UJAFsfE9AZAkaKSxiR7GlVNpvHP2s",
    appId: "1:70765643948:android:28f1a1ce2ee08a338e7709",
    messagingSenderId: "70765643948",
    projectId: "wallpapers4klatest",
  ));
  await Future.delayed(const Duration(seconds: 1)).whenComplete(() async => await ConfigService.configureAmplify());

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeVM()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Manrope',
            dividerColor: AppColors.kDividerColor),
        onGenerateRoute: AppRoutes.generateRoute,
        home: const SplashView(),
      );
    });
  }
}
