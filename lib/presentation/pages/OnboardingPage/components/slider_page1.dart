import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';

class FirstSliderPage extends StatelessWidget {
  const FirstSliderPage({
    super.key,
    required this.mochiyPopOneStyle,
  });

  final TextStyle mochiyPopOneStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 330.h,
            width: 300.w,
            child: Image.asset(Assets.assetsCoffeeCap)),
        Text("Welcome to Shay Buna", style: mochiyPopOneStyle),
        const SizedBox(height: 10),
        Text("We're excited to help you find the perfect cup of coffee",
            textAlign: TextAlign.center,
            style: mochiyPopOneStyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 18.sp,
                color: MyColors.kThirdColor)),
        const SizedBox(height: 50),
      ],
    );
  }
}
