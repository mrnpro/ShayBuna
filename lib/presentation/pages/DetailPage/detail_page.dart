import 'package:coffee_shop/core/Router/route_names.dart';
import 'package:coffee_shop/core/constants/assets.dart';
import 'package:coffee_shop/presentation/controllers/OrdersController/orders_controller.dart';
import 'package:coffee_shop/presentation/controllers/OrdersController/orders_state.dart';
import 'package:coffee_shop/presentation/pages/DetailPage/coffee_size_model.dart';
import 'package:coffee_shop/presentation/pages/PaymentPages/payment_error_screen.dart';
import 'package:coffee_shop/presentation/pages/PaymentPages/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Models/coffee_model.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/common_widgets.dart';
import '../../../core/constants/text_styles.dart';

import 'circle_animated_image.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String coffeeSize = "M";
  int selectedIndex = 1;
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

  _getButton() {
    return HookConsumer(builder: (context, ref, child) {
      ref.listen(ordersStateNotifierProvider, (previous, next) {
        next.maybeWhen(
            orElse: () {},
            error: (error) {
              context.go(RouteNames.paymentErrorPath,
                  extra: error ?? "something went wrong please try later");
            },
            orderPlaced: () {
              context.push(RouteNames.paymentSuccessPath);
            });
      });
      final isLoading = ref
          .watch(ordersStateNotifierProvider)
          .maybeWhen(orElse: () => false, loading: () => true);

      return Column(
        children: [
          const SizedBox(height: 48),
          if (isLoading)
            SizedBox(
              width: 361,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.kSecondaryColor),
                  onPressed: () {},
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ])),
            )
          else
            SizedBox(
              width: 361,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.kSecondaryColor),
                  onPressed: () {
                    ref.read(ordersStateNotifierProvider.notifier).placeOrder(
                        context: context,
                        price: widget.coffeeModel.price,
                        pid: widget.coffeeModel.pid,
                        coffeeSize: coffeeSize);
                  },
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
        ],
      );
    });
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
            for (int index = 0; index < coffeeSizeList.length; index++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;

                    coffeeSize = coffeeSizeList[index].size;
                  });
                },
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 41,
                    height: 37,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? MyColors.kPrimaryColor
                          : null,
                      border: Border.all(color: MyColors.kPrimaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text(coffeeSizeList[index].size,
                            style: mochiyPopOneStyle.copyWith(
                              color: selectedIndex == index
                                  ? MyColors.kSecondaryColor
                                  : null,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            )))),
              ),
          ],
        )
      ]),
    );
  }

  Align _arrowBack() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          context.pop();
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
