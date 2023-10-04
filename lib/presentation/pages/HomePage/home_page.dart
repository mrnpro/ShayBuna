import 'package:coffee_shop/core/constants/assets.dart';
import 'package:coffee_shop/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controllers/coffees_data_controller.dart';
import '../DetailPage/detail_page.dart';

import 'Components/choice_chips.dart';
import 'Components/coffee_card.dart';
import 'Components/special_for_you_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle poppinsStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: MyColors.kSecondaryColor);
  final TextStyle mochiyPopOneStyle = GoogleFonts.mochiyPopOne(
      fontWeight: FontWeight.bold,
      fontSize: 25.sp,
      color: MyColors.kPrimaryColor);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kPrimaryColor, body: _body(context));
  }

  _body(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        child: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
              child: Column(children: [
                _shaybunaLogo(),
                _searchFlavor(size: size, poppinsStyle: poppinsStyle),
                _CategoryChoice(
                  size: size,
                  poppinsStyle: poppinsStyle,
                ),
                _categories(),
                _specialForYouText(),
                _specialList(size)
              ]),
            )),
      ),
    );
  }

  Column _specialList(Size size) {
    return Column(children: [
      SpecialForYouItem(size: size, poppinsStyle: poppinsStyle),
      SpecialForYouItem(size: size, poppinsStyle: poppinsStyle),
      SpecialForYouItem(size: size, poppinsStyle: poppinsStyle)
    ]);
  }

  Padding _specialForYouText() {
    return Padding(
      padding: const EdgeInsets.only(top: 56, left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Special for you ",
            style: poppinsStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  _categories() {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      child: Consumer<CoffeeDataController>(
        builder: (context, controller, child) {
          return Row(
            children: controller.coffeeData
                .map(
                  (e) => CoffeeCard(
                      coffeeModel: e,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      coffeeModel: e,
                                    )));
                      },
                      mochiyPopOneStyle: mochiyPopOneStyle,
                      poppinsStyle: poppinsStyle),
                )
                .toList(),
          );
        },
      ),
    );
  }

  Column _shaybunaLogo() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Hero(tag: 'shay_buna_logo', child: SvgPicture.asset(Assets.assetsLogo)),
      ],
    );
  }
}

class _CategoryChoice extends StatefulWidget {
  const _CategoryChoice({
    required this.size,
    required this.poppinsStyle,
  });

  final Size size;
  final TextStyle poppinsStyle;

  @override
  State<_CategoryChoice> createState() => _CategoryChoiceState();
}

class _CategoryChoiceState extends State<_CategoryChoice> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Consumer<CoffeeDataController>(builder: (context, controller, child) {
          return SizedBox(
            height: 34,
            width: widget.size.width,
            child: ListView.builder(
                itemCount: controller.allCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == controller.getSelectedCategoryIndex) {
                    return CustomChoiceChip(
                        isActive: true,
                        chipText: controller.allCategories[index],
                        poppinsStyle: widget.poppinsStyle,
                        onPressed: () {
                          controller.changeCurrentCategoryIndex(
                              currentIndex: index);
                          controller.fetchData(
                              categoryName: controller.allCategories[index]);
                        });
                  }

                  return CustomChoiceChip(
                      isActive: false,
                      chipText: controller.allCategories[index],
                      poppinsStyle: widget.poppinsStyle,
                      onPressed: () {
                        controller.changeCurrentCategoryIndex(
                            currentIndex: index);
                        controller.fetchData(
                            categoryName: controller.allCategories[index]);
                      });
                }),
          );

          // NotActiveChip(poppinsStyle: poppinsStyle, onPressed: () {}),
          // NotActiveChip(poppinsStyle: poppinsStyle, onPressed: () {}),
          // NotActiveChip(poppinsStyle: poppinsStyle, onPressed: () {}),
          // NotActiveChip(poppinsStyle: poppinsStyle, onPressed: () {}),
        }),
      ],
    );
  }
}

class _searchFlavor extends StatelessWidget {
  const _searchFlavor({
    required this.size,
    required this.poppinsStyle,
  });

  final Size size;
  final TextStyle poppinsStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
          width: size.width,
          height: 51,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: MyColors.kSecondaryColor),
              color: const Color(0xffdacabd)),
          child: Row(children: [
            SvgPicture.asset(Assets.assetsSearchIcon),
            const SizedBox(
              width: 10,
            ),
            Text("Search your flavor", style: poppinsStyle)
          ]),
        )
      ],
    );
  }
}
