import 'package:coffee_shop/core/Router/route_names.dart';
import 'package:coffee_shop/riverpod_container.dart';
import 'package:coffee_shop/presentation/pages/LoginPage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../HomePage/Components/special_for_you_item.dart';
import 'components/profile_menu.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  _signout() {
    ref.read(firebaseAuthProvider).signOut();
    context.pushReplacement(RouteNames.loginPath);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CircleAvatar(
          radius: 70.h,
          backgroundColor: MyColors.kGrey,
          child: const Icon(
            Icons.person,
            size: 55,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ProfileMenu(
          text: "Edit Profile",
          press: () {},
        ),
        ProfileMenu(
          text: "Settings",
          press: () {},
        ),
        ProfileMenu(
            text: "Logout",
            press: () {
              showDialog(
                context: context,
                builder: (context) => DialogBody(
                  onYesPressed: () {
                    _signout();
                  },
                  onNoPressed: () {
                    Navigator.pop(context);
                  },
                ),
              );
            }),
      ],
    ));
  }
}

class DialogBody extends StatelessWidget {
  const DialogBody({
    super.key,
    required this.onYesPressed,
    required this.onNoPressed,
  });
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Are you sure you want to logout ?",
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(onPressed: onYesPressed, child: const Text("Yes")),
        TextButton(onPressed: onNoPressed, child: const Text("No"))
      ],
    );
  }
}
