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

  Future<void> _pullRefresh() async {
    await ref.read(ordersStateNotifierProvider.notifier).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: MyColors.kPrimaryColor,
      appBar: _appBar(size),
      body: RefreshIndicator(
        onRefresh: () {
          return _pullRefresh();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ref.watch(ordersStateNotifierProvider).maybeWhen(orElse: () {
                return _loading(size);
              }, ordersFetched: (data) {
                return _onData(data, size);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Column _onData(List<OrdersModel> data, Size size) {
    return Column(
      children: [
        for (var element in data)
          _order(size,
              price: "${element.price} ETB",
              status: element.deliveryStatus,
              title: "Capuccino"),
      ],
    );
  }

  ListView _loading(Size size) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => Skeleton(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: size.width,
        height: 113.h,
      ),
    );
  }

  PreferredSize _appBar(Size size) {
    return PreferredSize(
      preferredSize: Size(size.width, 80),
      child: Container(
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
          )),
    );
  }

  Container _order(Size size, {String? title, String? price, String? status}) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        width: size.width,
        //  height: 113.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            //boxShadow: [kBoxShadow],
            color: MyColors.kGrey),
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
              // margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
              width: 80.h,
              height: 80.h,
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
