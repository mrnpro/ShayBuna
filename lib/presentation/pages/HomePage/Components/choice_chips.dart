import 'package:coffee_shop/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.poppinsStyle,
    required this.onPressed,
    required this.chipText,
    required this.isActive,
  });
  final bool isActive;
  final String chipText;
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
              color: isActive
                  ? MyColors.kSecondaryColor
                  : const Color(0xffdacabd)),
          child: Center(
            child: Text(chipText,
                style: poppinsStyle.copyWith(
                  color: isActive ? MyColors.kPrimaryColor : null,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )),
          )),
    );
  }
}
