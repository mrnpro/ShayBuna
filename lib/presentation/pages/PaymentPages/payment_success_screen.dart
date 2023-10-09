import 'package:coffee_shop/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/assets.dart';
import 'payment_body.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kSecondaryColor, body: _body(context));
  }

  _body(BuildContext context) {
    return const PaymentBody(
        message:
            "Payment successful, Enjoy your coffee and have a wonderful day!\n☕🌞");
  }
}
