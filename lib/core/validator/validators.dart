class Validator {
  static bool isEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isPassword(String password) {
    return RegExp(r'^.{8,}$').hasMatch(password);
  }

  static bool isPhoneNumber(String phoneNumber) {
    return RegExp(r'^\+?\d{1,3}[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$')
        .hasMatch(phoneNumber);
  }
}
