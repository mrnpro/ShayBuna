import 'package:coffee_shop/core/constants/text_styles.dart';
import 'package:coffee_shop/presentation/controllers/AuthController/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kPrimaryColor, body: _body(context));
  }

  late FocusNode _emailFocus;
  late bool _emailHasFocus;

  @override
  void initState() {
    super.initState();
    _emailFocus = FocusNode();
    _emailHasFocus = false;

    // listeners
    _emailFocus.addListener(_onEmailFocusChange);
  }

  @override
  void dispose() {
    _emailFocus.removeListener(_onEmailFocusChange);
    _emailFocus.dispose();
    _emailController.clear();

    super.dispose();
  }

  void _onEmailFocusChange() {
    setState(() {
      _emailHasFocus = _emailFocus.hasFocus;
    });
  }

  _body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
          child: SizedBox(
              width: size.width,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  _arrowBack(context),
                  _shaybunaLogo(),
                  _emailAdressField(size),
                  _sendResetCodeBtn(size),
                ]),
              )))),
    );
  }

  _arrowBack(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 39,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _sendResetCodeBtn(Size size) {
    return HookConsumer(
      builder: (context, ref, child) {
        ref.listen(authNotifierProvider, (previous, next) {
          next.maybeWhen(
              orElse: () {},
              wildSucceed: (message) {
                SnackBar(
                  content: Text(message),
                  behavior: SnackBarBehavior.floating,
                );
                Future.delayed(const Duration(seconds: 2)).then((value) {
                  Navigator.pop(context);
                });
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              });
        });

        final isLoading = ref
            .watch(authNotifierProvider)
            .maybeWhen(orElse: () => false, loading: () => true);
        if (isLoading) {
          return Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.kSecondaryColor,
                          elevation: 3),
                      onPressed: () {},
                      child: CircularProgressIndicator(
                        color: MyColors.kPrimaryColor,
                      )),
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 50,
                width: size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.kSecondaryColor, elevation: 3),
                  onPressed: () {
                    ref
                        .read(authNotifierProvider.notifier)
                        .forgotPassword(_emailController.text.trim());
                  },
                  child: Text(
                    "Reset",
                    style: mochiyPopOneStyle.copyWith(
                        color: MyColors.kPrimaryColor, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 50,
              width: size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.kSecondaryColor, elevation: 3),
                onPressed: () {},
                child: Text(
                  "Reset",
                  style: mochiyPopOneStyle.copyWith(
                      color: MyColors.kPrimaryColor, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
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

  Column _emailAdressField(Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: size.width,
          height: 51,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: MyColors.kSecondaryColor,
                  width: _emailHasFocus ? 1.2 : 0),
              color: const Color(0xffdacabd)),
          child: Row(children: [
            const Icon(
              Icons.email,
              color: MyColors.kSecondaryColor,
            ),
            Expanded(
                child: TextFormField(
              focusNode: _emailFocus,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Your Email Adress"),
            ))
          ]),
        )
      ],
    );
  }
}
