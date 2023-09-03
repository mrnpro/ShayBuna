import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';

class ThirdSliderPage extends StatelessWidget {
  const ThirdSliderPage({
    super.key,
    required this.mochiyPopOneStyle,
  });

  final TextStyle mochiyPopOneStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 300,
            width: 300,
            child: Image.asset(Assets.assetsChapaLogo)),
        Text("We accept payments through Chapa",
            textAlign: TextAlign.center, style: mochiyPopOneStyle),
        const SizedBox(height: 10),
        Text("a secure and convenient payment gateway.",
            textAlign: TextAlign.center,
            style: mochiyPopOneStyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: MyColors.kThirdColor)),
        const SizedBox(height: 20),
      ],
    );
  }
}
