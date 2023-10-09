import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get chapaSecretKey => dotenv.env['CHAPA_SECRET_KEY'] ?? "";
}
