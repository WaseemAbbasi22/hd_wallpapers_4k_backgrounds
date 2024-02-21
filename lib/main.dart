import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
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
          title: 'Flutter Demo',
          // 2. Provide light theme.
          theme: AppTheme.light,
          // 3. Provide dark theme.
          darkTheme: AppTheme.dark,
          // 4. Watch AppTheme changes (ThemeMode).
          themeMode: context.watch<AppTheme>().themeMode,
            onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        ),
      );
    });
  }
}
