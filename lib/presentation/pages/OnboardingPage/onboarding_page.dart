import 'package:coffee_shop/presentation/pages/OnboardingPage/components/slider_page1.dart';
import 'package:coffee_shop/presentation/pages/OnboardingPage/components/slider_page2.dart';
import 'package:coffee_shop/presentation/pages/OnboardingPage/components/slider_page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OboardingPage extends StatefulWidget {
  const OboardingPage({super.key});

  @override
  State<OboardingPage> createState() => _OboardingPageState();
}

class _OboardingPageState extends State<OboardingPage> {
  final TextStyle mochiyPopOneStyle = GoogleFonts.mochiyPopOne(
      fontWeight: FontWeight.bold,
      fontSize: 25.sp,
      color: MyColors.kPrimaryColor);
  late PageController _pageController;
  int pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  void _onPageChanged(pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  void _onBtnPressed() {
    //
    if (pageIndex == 2) {
      // navigate to another screen
      return;
    }
    int nextPage = pageIndex + 1;
    _pageController.animateToPage(nextPage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kSecondaryColor, body: _body(context));
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // this is a decoration that appears on the top of the screen
            _topDecorator(),
            // this holds the page view
            _mainSlider(size),
            // this is the dots that changes everytime the slider gets swiped
            _changingDots(size),
            // this is the button helps changing the swipe
            _button()
          ],
        ),
      ),
    );
  }

  Column _button() {
    return Column(
      children: [
        const SizedBox(height: 100),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.kPrimaryColor, elevation: 3),
          onPressed: _onBtnPressed,
          child: Text(
            pageIndex == 2 ? "Start" : "Next",
            style: mochiyPopOneStyle.copyWith(
                color: MyColors.kSecondaryColor, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _changingDots(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 28,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == pageIndex) {
                return const FilledDot();
              }
              return const UnFilledDot();
            },
          ),
        ),
      ],
    );
  }

  Widget _mainSlider(Size size) {
    return SizedBox(
      height: 370.h,
      width: size.width,
      child: PageView(
          onPageChanged: _onPageChanged,
          controller: _pageController,
          children: [
            FirstSliderPage(mochiyPopOneStyle: mochiyPopOneStyle),
            SecondSliderPage(mochiyPopOneStyle: mochiyPopOneStyle),
            ThirdSliderPage(mochiyPopOneStyle: mochiyPopOneStyle),
          ]),
    );
  }

  SizedBox _topDecorator() {
    return SizedBox(
        height: 100.h,
        child: SvgPicture.asset(Assets.assetsOnboardingTopDecorator));
  }
}

class UnFilledDot extends StatelessWidget {
  const UnFilledDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: MyColors.kPrimaryColor)),
    );
  }
}

class FilledDot extends StatelessWidget {
  const FilledDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(2),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: MyColors.kPrimaryColor)),
        child: Container(
            height: 17,
            width: 17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: MyColors.kPrimaryColor,
            )));
  }
}
