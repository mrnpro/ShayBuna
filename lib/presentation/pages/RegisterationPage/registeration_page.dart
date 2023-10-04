import 'package:coffee_shop/core/constants/assets.dart';
import 'package:coffee_shop/core/constants/colors.dart';
import 'package:coffee_shop/core/validator/validators.dart';
import 'package:coffee_shop/presentation/pages/HomePage/home_page.dart';
import 'package:coffee_shop/presentation/pages/LoginPage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  final TextStyle poppinsStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: MyColors.kSecondaryColor);
  final TextStyle mochiyPopOneStyle = GoogleFonts.mochiyPopOne(
      fontWeight: FontWeight.bold,
      fontSize: 26.sp,
      color: MyColors.kPrimaryColor);
  late FocusNode _emailFocus;
  late bool _emailHasFocus;
  late FocusNode _passwordlFocus;
  late bool _passwordHasFocus;
  late FocusNode _phoneFocus;
  late bool _phoneHasFocus;
  List<String> _errorList = [];
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _emailFocus = FocusNode();
    _emailHasFocus = false;
    _passwordlFocus = FocusNode();
    _passwordHasFocus = false;
    _phoneFocus = FocusNode();
    _phoneHasFocus = false;
    // listeners
    _emailFocus.addListener(_onEmailFocusChange);
    _passwordlFocus.addListener(_onPasswordFocusChange);
    _phoneFocus.addListener(_onPhoneFocusChange);
  }

  @override
  void dispose() {
    _emailFocus.removeListener(_onEmailFocusChange);
    _emailFocus.dispose();
    _emailController.clear();
    _passwordlFocus.dispose();
    _passwordlFocus.removeListener(_onPasswordFocusChange);
    _passwordController.clear();
    _phoneFocus.removeListener(_onPhoneFocusChange);
    _phoneController.clear();

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

  void _onPhoneFocusChange() {
    setState(() {
      _phoneHasFocus = _phoneFocus.hasFocus;
    });
  }

  void _onRegisterBtnPressed() {
    if (validated()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  void _onAlreadyMemberPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

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
    if (!Validator.isPhoneNumber(_phoneController.text)) {
      collectedErrors.add('invalid phone number');
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
    setState(() {
      _errorList = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.kPrimaryColor, body: _body(context));
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
                  _phoneNumberField(size),
                  _passwordField(size),
                  _errorBox(size),
                  _registerBtn(size),
                  _alreadyMemberSignIn()
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

  _registerBtn(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.kSecondaryColor, elevation: 3),
          onPressed: _onRegisterBtnPressed,
          child: Text(
            "Register",
            style: mochiyPopOneStyle.copyWith(
                color: MyColors.kPrimaryColor, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Align _alreadyMemberSignIn() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: _onAlreadyMemberPressed,
          child: Text(
            "Already Member ?",
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

  Column _phoneNumberField(Size size) {
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
                  width: _phoneHasFocus ? 1.2 : 0),
              color: const Color(0xffdacabd)),
          child: Row(children: [
            const Icon(
              Icons.phone,
              color: MyColors.kSecondaryColor,
            ),
            Expanded(
                child: TextFormField(
              focusNode: _phoneFocus,
              controller: _phoneController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Your phone number"),
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
