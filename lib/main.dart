import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:coffee_shop/core/Router/my_route.dart';
import 'package:coffee_shop/firebase_options.dart';
import 'package:coffee_shop/presentation/pages/HomePage/home_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/config/config.dart';
import 'core/theme/my_theme.dart';
import 'presentation/pages/SplashPage/splash_page.dart';
import 'presentation/pages/onboardingPage/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // initialize app check
  await FirebaseAppCheck.instance.activate();
  // load env config file
  await dotenv.load(fileName: ".env");
  // configure chapa
  Chapa.configure(privateKey: Config.chapaSecretKey);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// i have instanciated here b/c whenever hot reload is triggered the splash screen is poping up.
final router = MyRouteConfig().getRouter;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430.0, 932.0),
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Shay Buna',
          theme: MyTheme.lightTheme,

          // )
        );
      },
    );
  }
}
