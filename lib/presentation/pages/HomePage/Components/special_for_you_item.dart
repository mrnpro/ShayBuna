import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Models/coffee_model.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/common_widgets.dart';

class SpecialForYouItem extends StatelessWidget {
  const SpecialForYouItem({
    super.key,
    required this.size,
    required this.poppinsStyle,
    required this.coffeeModel,
    required this.onPressed,
  });

  final Size size;
  final TextStyle poppinsStyle;
  final CoffeeModel coffeeModel;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: size.width,
          height: 113,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              boxShadow: [kBoxShadow],
              color: MyColors.kSecondaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(coffeeModel.title,
                        style: poppinsStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: MyColors.kPrimaryColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(coffeeModel.discountText ?? "No Discount",
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColors.kPrimaryColor,
                          fontWeight: FontWeight.w700,
                        )),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: 103,
                height: 113,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: MyColors.kPrimaryColor, width: 3),
                    image: const DecorationImage(
                        image: AssetImage(Assets.assetsCapuccinoImage))),
              )
            ],
          )),
    );
  }
}
