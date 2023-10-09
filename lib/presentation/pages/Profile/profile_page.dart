import 'package:coffee_shop/presentation/pages/LoginPage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        const SizedBox(
          height: 50,
        ),
        CircleAvatar(
          backgroundColor: MyColors.kSecondaryColor.withOpacity(0.5),
          radius: 80.h,
          child: CircleAvatar(
            radius: 40.h,
            backgroundColor: MyColors.kSecondaryColor,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 30.h,
                color: MyColors.kPrimaryColor,
              ),
            ),
          ),
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
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false);
          },
        )
      ],
    ));
  }
}
