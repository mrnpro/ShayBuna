import 'package:coffee_shop/core/Router/route_names.dart';
import 'package:coffee_shop/riverpod_container.dart';
import 'package:coffee_shop/presentation/pages/LoginPage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../HomePage/Components/special_for_you_item.dart';
import 'components/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
        child: Column(
      children: [
        ProfileMenu(
          text: "Edit Profile",
          press: () {},
        ),
        ProfileMenu(
          text: "Settings",
          press: () {},
        ),
        HookConsumer(
          builder: (context, ref, child) => ProfileMenu(
            text: "Logout",
            press: () {
              ref.read(firebaseAuthProvider).signOut();
              context.pushReplacement(RouteNames.loginPath);
            },
          ),
        )
      ],
    ));
  }
}
