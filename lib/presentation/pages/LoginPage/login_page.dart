import 'package:coffee_shop/core/constants/assets.dart';
import 'package:coffee_shop/core/constants/colors.dart';
import 'package:coffee_shop/core/validator/validators.dart';
import 'package:coffee_shop/presentation/controllers/AuthController/auth_controller.dart';
import 'package:coffee_shop/presentation/pages/ForgotPasswordPage/forgot_password_page.dart';
import 'package:coffee_shop/presentation/pages/HomePage/home_page.dart';
import 'package:coffee_shop/presentation/pages/RegisterationPage/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/text_styles.dart';
import '../../bottom_nav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode _emailFocus;
  late bool _emailHasFocus;
  late FocusNode _passwordlFocus;
  late bool _passwordHasFocus;
  @override
  void initState() {
    super.initState();
    _emailFocus = FocusNode();
    _emailHasFocus = false;
    _passwordlFocus = FocusNode();
    _passwordHasFocus = false;

    // listeners
    _emailFocus.addListener(_onEmailFocusChange);
    _passwordlFocus.addListener(_onPasswordFocusChange);
  }

  @override
  void dispose() {
    _errorList.clear();
    _emailFocus.removeListener(_onEmailFocusChange);
    _emailFocus.dispose();
    _emailController.clear();
    _passwordlFocus.dispose();
    _passwordlFocus.removeListener(_onPasswordFocusChange);
    _passwordController.clear();

    super.dispose();
  }

  void _onEmailFocusChange() {
    setState(() {
      _emailHasFocus = _emailFocus.hasFocus;
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      _passwordHasFocus = _passwordlFocus.hasFocus;
    });
  }

  void _onForgotPasswordPressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
  }

  void _onSignupPressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterationPage()));
  }

  List<String> _errorList = [];
  bool validated() {
    final collectedErrors = <String>[];

    // validate email
    if (!Validator.isEmail(_emailController.text)) {
      collectedErrors.add("invalid email adress");
    }
    // validate password
    if (!Validator.isPassword(_passwordController.text)) {
      collectedErrors.add('invalid password , it should contain 8 characters');
    }
    // validate CollectedErrors
    if (collectedErrors.isNotEmpty) {
      _addError(collectedErrors);
      return false;
    }
    _clearErrorList();
    return true;
  }

  void _clearErrorList() {
    setState(() {
      _errorList.clear();
    });
  }

  void removeErrorList(String error) {
    setState(() {
      _errorList.removeWhere((element) => element == error);
    });
  }

  void _addError(List<String> error) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _errorList = error;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kPrimaryColor, body: _body(context));
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                  //_arrowBack(context),
                  _shaybunaLogo(),
                  _emailAdressField(size),
                  _passwordField(size),
                  _errorBox(size),
                  _forgotPassword(),
                  _loginBtn(size),
                  _signup()
                ]),
              )))),
    );
  }

  Align _arrowBack(BuildContext context) {
    return Align(
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
    );
  }

  _errorBox(Size size) {
    if (_errorList.isNotEmpty) {
      return Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 74, 23, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Error",
                style: mochiyPopOneStyle.copyWith(
                    color: MyColors.kPrimaryColor, fontSize: 18),
              ),
            ),
            Column(
              children: _errorList
                  .map(
                    (e) => Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "        X ",
                              style: mochiyPopOneStyle.copyWith(fontSize: 18)),
                          TextSpan(
                            text: e,
                            style: poppinsStyle.copyWith(
                                color: MyColors.kPrimaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  _loginBtn(Size size) {
    return HookConsumer(builder: (context, ref, child) {
      ref.listen(authNotifierProvider, (previous, next) {
        next.maybeWhen(
            orElse: () {},
            authenticated: (user) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BottomNav()));
            },
            error: (message) {
              _addError([message]);
            });
      });
      final isLoading = ref
          .watch(authNotifierProvider)
          .maybeWhen(orElse: () => false, loading: () => true);
      if (isLoading) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: size.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.kSecondaryColor, elevation: 3),
                onPressed: () {},
                child: CircularProgressIndicator(
                  color: MyColors.kPrimaryColor,
                )),
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          width: size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.kSecondaryColor, elevation: 3),
            onPressed: () {
              if (validated()) {
                ref.read(authNotifierProvider.notifier).login(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim());
              }
            },
            child: Text(
              "Login",
              style: mochiyPopOneStyle.copyWith(
                  color: MyColors.kPrimaryColor, fontSize: 15),
            ),
          ),
        ),
      );
    });
  }

  _forgotPassword() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: _onForgotPasswordPressed,
              child: Text(
                "Forgot Password ?",
                style: poppinsStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ),
      ],
    );
  }

  Align _signup() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: _onSignupPressed,
          child: Text(
            "Signup ?",
            style: poppinsStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 16),
          )),
    );
  }

  Column _emailAdressField(Size size) {
    return Column(
      children: [
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

  Column _passwordField(Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
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
                  width: _passwordHasFocus ? 1.2 : 0),
              color: const Color(0xffdacabd)),
          child: Row(children: [
            const Icon(
              Icons.lock,
              color: MyColors.kSecondaryColor,
            ),
            Expanded(
                child: TextFormField(
              focusNode: _passwordlFocus,
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Your password"),
            ))
          ]),
        )
      ],
    );
  }

  Column _shaybunaLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
            height: 250,
            child: Hero(
              tag: 'shay_buna_logo',
              child: SvgPicture.asset(
                Assets.assetsLogo,
                height: 100.h,
              ),
            )),
      ],
    );
  }
}
