import 'package:coffee_shop/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.kSecondaryColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: MyColors.kPrimaryColor),
              iconSize: 30.h,
            ),
            title: Row(
              children: [
                Expanded(
                    child: TextField(
                  autofocus: true,
                  style: poppinsStyle.copyWith(
                      color: MyColors.kPrimaryColor, fontSize: 20.sp),
                  decoration: InputDecoration(
                      hintStyle: poppinsStyle.copyWith(
                          color: MyColors.kPrimaryColor, fontSize: 20.sp),
                      border: InputBorder.none,
                      hintText: "Search your flavor"),
                )),
                Hero(
                  tag: 'filter_icon',
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_alt, color: MyColors.kPrimaryColor),
                    iconSize: 30.h,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: MyColors.kPrimaryColor,
          body: _body(context)),
    );
  }

  _body(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return const Column(
      children: [],
    );
  }
}
