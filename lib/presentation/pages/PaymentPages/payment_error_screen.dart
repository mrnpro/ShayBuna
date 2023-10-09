import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import 'payment_body.dart';

class PaymentErrorScreen extends StatefulWidget {
  const PaymentErrorScreen({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  State<PaymentErrorScreen> createState() => _PaymentErrorScreenState();
}

class _PaymentErrorScreenState extends State<PaymentErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kSecondaryColor, body: _body(context));
  }

  _body(BuildContext context) {
    return PaymentBody(message: widget.errorMessage);
  }
}
