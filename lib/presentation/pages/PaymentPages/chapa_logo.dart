import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets.dart';

class ChapaLogo extends StatelessWidget {
  const ChapaLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300.h,
        width: 300.w,
        child: Image.asset(Assets.assetsChapaLogo));
  }
}
