import 'package:coffee_shop/Models/orders_model.dart';
import 'package:coffee_shop/core/Components/skeleton.dart';
import 'package:coffee_shop/presentation/controllers/OrdersController/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/common_widgets.dart';
import '../../../core/constants/text_styles.dart';
import '../HomePage/Components/special_for_you_item.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(ordersStateNotifierProvider.notifier).getOrders();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        _appBar(size),
        SizedBox(
          height: size.height / 1.3.h,
          width: size.width,
          child: ref.watch(ordersStateNotifierProvider).maybeWhen(orElse: () {
            return _loading(size);
          }, ordersFetched: (data) {
            return _onData(data, size);
          }),
        ),
      ],
    );
  }

  ListView _onData(List<OrdersModel> data, Size size) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => _order(size,
          price: "${data[index].price} ETB",
          status: data[index].deliveryStatus,
          title: "Capuccino"),
    );
  }

  ListView _loading(Size size) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Skeleton(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: size.width,
        height: 113.h,
      ),
    );
  }

  Container _appBar(Size size) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: size.width,
        height: 80.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MyColors.kSecondaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Orders",
                  style: poppinsStyle.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.kPrimaryColor)),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.coffee,
              color: MyColors.kPrimaryColor,
            ),
          ],
        ));
  }

  Container _order(Size size, {String? title, String? price, String? status}) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        width: size.width,
        height: 113.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            boxShadow: [kBoxShadow],
            color: MyColors.kPrimaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(title ?? "something",
                      style: poppinsStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: MyColors.kSecondaryColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(price ?? "0ETB",
                      style: poppinsStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: MyColors.kSecondaryColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(status ?? "pending",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.kSecondaryColor,
                        fontWeight: FontWeight.normal,
                      )),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: MyColors.kSecondaryColor, width: 3),
                  image: const DecorationImage(
                      image: AssetImage(Assets.assetsCoffeeCap))),
            )
          ],
        ));
  }
}
