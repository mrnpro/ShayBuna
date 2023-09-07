import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/common_widgets.dart';
import '../../../../data/CoffeeData/coffee_model.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    super.key,
    required this.mochiyPopOneStyle,
    required this.poppinsStyle,
    required this.onPressed,
    required this.coffeeModel,
  });

  final TextStyle mochiyPopOneStyle;
  final TextStyle poppinsStyle;
  final VoidCallback onPressed;
  final CoffeeModel coffeeModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 22),
        padding: const EdgeInsets.all(15),
        width: 189,
        height: 293,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: MyColors.kSecondaryColor,
          boxShadow: [kBoxShadow],
        ),
        child: Column(
          children: [
            _coffeeImage(),
            _title(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coffeeModel.hasMilk ? "With Milk" : "No Milk",
                        style: poppinsStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyColors.kPrimaryColor)),
                    const SizedBox(height: 13),
                    Text("${coffeeModel.price}\nETB",
                        style: mochiyPopOneStyle.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: MyColors.kThirdColor))
                  ],
                ),
                SvgPicture.asset(
                  Assets.assetsLogoDecorator,
                  width: 85.03058624267578,
                  height: 79,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Align _title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 189 / 1.4,
        child: Text(coffeeModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: mochiyPopOneStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }

  Image _coffeeImage() {
    return Image.asset(
      Assets.assetsCoffeeCap,
      width: 141,
      height: 129,
    );
  }
}
