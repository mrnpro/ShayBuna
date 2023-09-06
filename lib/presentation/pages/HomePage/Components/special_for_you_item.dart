import 'package:flutter/cupertino.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/common_widgets.dart';

class SpecialForYouItem extends StatelessWidget {
  const SpecialForYouItem({
    super.key,
    required this.size,
    required this.poppinsStyle,
  });

  final Size size;
  final TextStyle poppinsStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: size.width,
        height: 113,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
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
                  child: Text("Cappuccino",
                      style: poppinsStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: MyColors.kPrimaryColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("10 % Discount",
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
        ));
  }
}
