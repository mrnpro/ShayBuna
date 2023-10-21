import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:coffee_shop/core/Router/route_names.dart';
import 'package:coffee_shop/core/constants/assets.dart';
import 'package:coffee_shop/core/constants/colors.dart';
import 'package:coffee_shop/core/constants/text_styles.dart';
import 'package:coffee_shop/presentation/controllers/CoffeeController/coffee_category_controller.dart';
import 'package:coffee_shop/presentation/controllers/CoffeeController/coffee_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Models/coffee_model.dart';
import '../../../core/Components/skeleton.dart';
import '../../controllers/SpecialController/special_data_controller.dart';
import '../DetailPage/detail_page.dart';

import '../SearchPage/search_page.dart';
import 'Components/choice_chips.dart';
import 'Components/coffee_card.dart';
import 'Components/special_for_you_item.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Future<void> _pullRefresh() async {
    // reset category index from index 0
    ref.read(categoryIndexStateProvider.notifier).state = 0;
    // fetch all categories
    ref.read(cofeeCategoryNotifier.notifier).fetchAllCategories();
    // fetch all specials
    ref.read(specialDataStateNotifierProvider.notifier).fetchSpecials();
    // fetch all coffee datas with default All Category

    await ref.read(coffeeNotifierProvider.notifier).fetchCoffee();
  }

  _body(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
            width: size.width,
            child: RefreshIndicator(
              onRefresh: () {
                return _pullRefresh();
              },
              child: SingleChildScrollView(
                child: Column(children: [
                  _topSection(),
                  _SearchFlavor(size: size, poppinsStyle: poppinsStyle),
                  _CategoryChoice(
                    size: size,
                    poppinsStyle: poppinsStyle,
                  ),
                  _categories(),
                  _specialList(size)
                ]),
              ),
            )),
      ),
    );
  }

  Row _topSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              //open drawer
            },
            icon: const Icon(Icons.menu)),
        _shaybunaLogo(),
        const Text("              ")
      ],
    );
  }

  Column _shaybunaLogo() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SvgPicture.asset(Assets.assetsLogo),
      ],
    );
  }

  _categories() {
    return SingleChildScrollView(
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        child: HookConsumer(
          builder: (context, ref, child) {
            final isLoading = ref
                .watch(coffeeNotifierProvider)
                .maybeWhen(orElse: () => false, loading: () => true);
            final data = ref.watch(coffeeNotifierProvider).maybeWhen(
                  orElse: () => null,
                  loaded: (coffees) => coffees,
                );

            if (isLoading || data == null) {
              return _coffeeLoading(context);
            }
            return _coffeeDisplay(data, context);
          },
        ));
  }

  Widget _specialList(Size size) {
    return Column(
      children: [
        HookConsumer(builder: (context, ref, child) {
          return ref.watch(specialDataStateNotifierProvider).maybeWhen(
              orElse: () {
            return Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Skeleton(
                    margin: EdgeInsets.only(top: 56, left: 10, bottom: 5),
                    height: 20,
                    width: 100,
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Skeleton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 2),
                          width: size.width,
                          height: 113,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }, data: (data) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _specialForYouText(),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(specialDataStateNotifierProvider.notifier)
                              .fetchSpecials();
                        },
                        icon: const Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              ...data.map((coffee) {
                return SpecialForYouItem(
                    onPressed: () {
                      context.push(RouteNames.coffeeDetailPath, extra: coffee);
                    },
                    coffeeModel: coffee,
                    size: size,
                    poppinsStyle: poppinsStyle);
              })
            ]);
          });
        }),
      ],
    );
  }

  _specialForYouText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text("Special for you ",
          style: poppinsStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  Row _coffeeDisplay(List<CoffeeModel> data, BuildContext context) {
    return Row(
      children: data
          .map(
            (coffee) => CoffeeCard(
                coffeeModel: coffee,
                onPressed: () {
                  context.push(RouteNames.coffeeDetailPath, extra: coffee);
                },
                mochiyPopOneStyle: mochiyPopOneStyle,
                poppinsStyle: poppinsStyle),
          )
          .toList(),
    );
  }

  SizedBox _coffeeLoading(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 293,
      child: ListView.builder(
        clipBehavior: Clip.none,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Skeleton(
            margin: const EdgeInsets.only(left: 10, top: 22),
            width: 189,
            height: 293,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                Assets.assetsLogoDecorator,
                width: 20,
                height: 199,
              ),
            ),
          );
        },
      ),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        HookConsumer(
          builder: (context, ref, child) {
            final currentSelectedIndex = ref.watch(categoryIndexStateProvider);

            final isLoading = ref.watch(cofeeCategoryNotifier).maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                );
            final data = ref.watch(cofeeCategoryNotifier).maybeWhen(
                  orElse: () => null,
                  data: (coffees) => coffees,
                );
            if (isLoading || data == null) {
              return _categoryLoading();
            }
            return _categoryData(data, currentSelectedIndex, ref);
          },
        ),
      ],
    );
  }

  SizedBox _categoryData(
      List<String> data, int currentSelectedIndex, WidgetRef ref) {
    return SizedBox(
      height: 34,
      width: widget.size.width,
      child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == currentSelectedIndex) {
              return CustomChoiceChip(
                  isActive: true,
                  chipText: data[index],
                  poppinsStyle: widget.poppinsStyle,
                  onPressed: () {});
            }

            return CustomChoiceChip(
                isActive: false,
                chipText: data[index],
                poppinsStyle: widget.poppinsStyle,
                onPressed: () {
                  print(index);
                  ref.read(categoryIndexStateProvider.notifier).state = index;
                  ref
                      .read(coffeeNotifierProvider.notifier)
                      .fetchCoffee(category: data[index]);
                });
          }),
    );
  }

  SizedBox _categoryLoading() {
    return SizedBox(
      height: 34,
      width: widget.size.width,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomChoiceChip(
                isActive: false,
                chipText: "",
                poppinsStyle: widget.poppinsStyle,
                onPressed: () {});
          }),
    );
  }
}

class _SearchFlavor extends StatelessWidget {
  const _SearchFlavor({
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
        InkWell(
          onTap: () {
            context.push(RouteNames.coffeeSearchPath);
          },
          child: SizedBox(
            width: size.width,
            height: 51,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: MyColors.kSecondaryColor),
                        color: const Color(0xffdacabd)),
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Hero(
                                    tag: 'search_icon',
                                    child: SvgPicture.asset(
                                        Assets.assetsSearchIcon)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Hero(
                                    tag: 'search_your_flavor',
                                    child: Text("Search your flavor",
                                        style: poppinsStyle)),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
                Hero(
                  tag: 'filter_icon',
                  child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyColors.kSecondaryColor),
                          color: MyColors.kSecondaryColor),
                      child: Icon(
                        Icons.filter_alt,
                        color: const Color(0xffdacabd),
                        size: 30.h,
                      )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
