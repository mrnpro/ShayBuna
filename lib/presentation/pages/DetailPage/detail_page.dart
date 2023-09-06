import 'package:coffee_shop/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

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
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    width: 62,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        color: MyColors.kSecondaryColor),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios,
                          size: 35, color: MyColors.kPrimaryColor),
                    )),
              ),
              Image.asset(
                Assets.assetsCoffeeCap,
                width: 241,
                height: 264,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: 361,
                height: 142,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: MyColors.kSecondaryColor),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("French\npress coffee",
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
                            child: Text("50 ETB",
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
                              color: const Color(0xffd9d9d9)),
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
              ),
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
              const SizedBox(height: 48),
              SizedBox(
                width: 361,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.kSecondaryColor),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get Now",
                              style: mochiyPopOneStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              )),
                          SvgPicture.asset(Assets.assetsBtnDecoratorLogo)
                        ])),
              )
              // Container(
              //     width: 361,
              //     height: 60,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(27),
              //         color: MyColors.kSecondaryColor),
              //     child: Text("Get Now",
              //         style: mochiyPopOneStyle.copyWith(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w400,
              //         )))
            ]),
          ),
        ),
      ),
    );
  }
}
