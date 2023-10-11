import 'package:coffee_shop/core/Router/route_names.dart';
import 'package:coffee_shop/core/constants/assets.dart';
import 'package:coffee_shop/core/constants/colors.dart';
import 'package:coffee_shop/core/constants/text_styles.dart';
import 'package:coffee_shop/riverpod_container.dart';
import 'package:coffee_shop/data/LocalData/local_data_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _animate();

    _navigate();
  }

  void _animate() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animation = Tween<double>(begin: 1.2.h, end: 1.4.h).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutSine));
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  _navigate() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    final user = ref.read(firebaseAuthProvider).currentUser;
    final localData = await ref.read(localDataProvider.future);

    final isFirstTime = localData.isExists(key: 'firstime');
    if (!isFirstTime) {
      // ignore: use_build_context_synchronously
      context.go(RouteNames.onboardingPath);
      return;
    }
    if (user == null) {
      // ignore: use_build_context_synchronously
      context.go(RouteNames.loginPath);
      return;
    }
    // ignore: use_build_context_synchronously
    context.go(RouteNames.botomNavPath);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          key: const Key("splash_screen"),
          backgroundColor: MyColors.kPrimaryColor,
          body: _body(context)),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                    scale: _animation.value,
                    child: SvgPicture.asset(Assets.assetsLogo));
              }),
        ],
      ),
    );
  }
}
