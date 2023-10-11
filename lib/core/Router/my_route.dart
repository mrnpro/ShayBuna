import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:coffee_shop/core/Router/route_names.dart';
import 'package:coffee_shop/presentation/bottom_nav.dart';
import 'package:coffee_shop/presentation/pages/DetailPage/detail_page.dart';
import 'package:coffee_shop/presentation/pages/ForgotPasswordPage/forgot_password_page.dart';
import 'package:coffee_shop/presentation/pages/LoginPage/login_page.dart';
import 'package:coffee_shop/presentation/pages/OnboardingPage/onboarding_page.dart';
import 'package:coffee_shop/presentation/pages/PaymentPages/payment_error_screen.dart';
import 'package:coffee_shop/presentation/pages/PaymentPages/payment_success_screen.dart';
import 'package:coffee_shop/presentation/pages/RegisterationPage/registeration_page.dart';
import 'package:coffee_shop/presentation/pages/SearchPage/search_page.dart';
import 'package:coffee_shop/presentation/pages/SplashPage/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'transition.dart';

class MyRouteConfig {
  get getRouter => GoRouter(routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const SplashScreen(),
          ),
        ),
        GoRoute(
          path: RouteNames.onboardingPath,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const OboardingPage(),
          ),
        ),
        GoRoute(
            path: RouteNames.loginPath,
            pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const LoginPage(),
                )),
        GoRoute(
            path: RouteNames.forgotPasswordPath,
            pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const ForgotPasswordPage(),
                )),
        GoRoute(
            path: RouteNames.registerPath,
            pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const RegisterationPage(),
                )),
        GoRoute(
          path: RouteNames.botomNavPath,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const BottomNav(),
          ),
        ),
        GoRoute(
          path: RouteNames.coffeeDetailPath,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: DetailPage(coffeeModel: state.extra as CoffeeModel),
          ),
        ),
        GoRoute(
            path: RouteNames.coffeeSearchPath,
            pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const SearchPage(),
                )),
        GoRoute(
            path: RouteNames.paymentSuccessPath,
            pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const PaymentSuccessScreen(),
                )),
        GoRoute(
            path: RouteNames.paymentErrorPath,
            pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child:
                      PaymentErrorScreen(errorMessage: state.extra as String),
                )),
      ]);
}
