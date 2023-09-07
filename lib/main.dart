import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/my_theme.dart';
import 'data/CoffeeData/mock_data.dart';
import 'presentation/controllers/coffees_data_controller.dart';
import 'presentation/pages/onboardingPage/onboarding_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return ChangeNotifierProvider<CoffeeDataController>(
            create: (_) => CoffeeDataController(MockDatas())
              ..fetchData()
              ..fetchAllCategories(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Shay Buna',
              theme: MyTheme.lightTheme,
              home: const OboardingPage(),
            ));
      },
    );
  }
}
