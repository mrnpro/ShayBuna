import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 300.h,
                    width: 300.w,
                    child: Image.asset(Assets.assetsChapaLogo)),
                Text(widget.message,
                    textAlign: TextAlign.center,
                    style: mochiyPopOneStyle.copyWith(fontSize: 15)),
                Column(
                  children: [
                    SizedBox(height: 100.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.kPrimaryColor,
                          elevation: 3),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Go back",
                        style: mochiyPopOneStyle.copyWith(
                            color: MyColors.kSecondaryColor, fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
