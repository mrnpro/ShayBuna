import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';

class SecondSliderPage extends StatelessWidget {
  const SecondSliderPage({
    super.key,
    required this.mochiyPopOneStyle,
  });

  final TextStyle mochiyPopOneStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(Assets.assetsCouplesCoffee)),
          Text("To get started", style: mochiyPopOneStyle),
          const SizedBox(height: 10),
          Text(
              "create an account and add your favorite coffee shops. You can also browse our list of featured shops.",
              textAlign: TextAlign.center,
              style: mochiyPopOneStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: MyColors.kThirdColor)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
