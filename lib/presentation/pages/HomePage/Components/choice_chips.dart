import 'package:flutter/material.dart';


import '../../../../core/constants/colors.dart';

class NotActiveChip extends StatelessWidget {
  const NotActiveChip({
    super.key,
    required this.poppinsStyle,
    required this.onPressed,
  });

  final TextStyle poppinsStyle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          margin: const EdgeInsets.only(left: 8),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              color: const Color(0xffdacabd)),
          child: Center(
            child: Text("Cappuccino",
                style: poppinsStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )),
          )),
    );
  }
}

class ActiveChip extends StatelessWidget {
  const ActiveChip({
    super.key,
    required this.poppinsStyle,
    required this.onPressed,
  });

  final TextStyle poppinsStyle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.5),
            color: MyColors.kSecondaryColor),
        child: Center(
          child: Text("All",
              style: poppinsStyle.copyWith(
                color: MyColors.kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}
