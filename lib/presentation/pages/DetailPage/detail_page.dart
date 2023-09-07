import 'package:coffee_shop/core/constants/assets.dart';
import 'package:coffee_shop/data/CoffeeData/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/common_widgets.dart';
import 'circle_animated_image.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextStyle poppinsStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: MyColors.kSecondaryColor);
  final TextStyle mochiyPopOneStyle = GoogleFonts.mochiyPopOne(
      fontWeight: FontWeight.bold,
      fontSize: 25.sp,
      color: MyColors.kPrimaryColor);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kPrimaryColor, body: _body(context));
  }

  _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: size.width,
            child: Column(children: [
              _arrowBack(),
              // _coffeeImage(),

              const CircleAnimationImage(),
              _coffeeInfoBox(size, widget.coffeeModel),
              _coffeeDescription(widget.coffeeModel.description),
              _getButton(),
            ]),
          ),
        ),
      ),
    );
  }

  Column _getButton() {
    return Column(
      children: [
        const SizedBox(height: 48),
        SizedBox(
          width: 361,
          height: 60,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.kSecondaryColor),
              onPressed: () {},
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Get Now",
                    style: mochiyPopOneStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
                SvgPicture.asset(Assets.assetsBtnDecoratorLogo)
              ])),
        )
      ],
    );
  }

  Column _coffeeDescription(String description) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.2,
                child: SizedBox(
                    height: 202,
                    width: 202,
                    child: SvgPicture.asset(
                      Assets.assetsLogo,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: mochiyPopOneStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: MyColors.kSecondaryColor)),
          ],
        ),
      ],
    );
  }

  Container _coffeeInfoBox(Size size, CoffeeModel coffeeModel) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width,
      height: 142,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: MyColors.kSecondaryColor,
          boxShadow: [kBoxShadow]),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(coffeeModel.title,
                style: mochiyPopOneStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            Container(
                width: 109,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: MyColors.kPrimaryColor),
                child: Center(
                  child: Text("${coffeeModel.price} ETB",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: mochiyPopOneStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.kSecondaryColor)),
                ))
          ],
        ),
        const SizedBox(height: 24),
        // coffee size .
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: 41,
                height: 37,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.kPrimaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text("L",
                        style: mochiyPopOneStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )))),
            Container(
                width: 41,
                height: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColors.kPrimaryColor),
                child: Center(
                  child: Text("M",
                      style: mochiyPopOneStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: MyColors.kSecondaryColor)),
                )),
            Container(
                width: 41,
                height: 37,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.kPrimaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text("S",
                        style: mochiyPopOneStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )))),
          ],
        ),
      ]),
    );
  }

  Align _arrowBack() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            width: 62,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: MyColors.kSecondaryColor,
                boxShadow: [kBoxShadow]),
            child: Center(
              child: Icon(Icons.arrow_back_ios,
                  size: 35, color: MyColors.kPrimaryColor),
            )),
      ),
    );
  }
}
