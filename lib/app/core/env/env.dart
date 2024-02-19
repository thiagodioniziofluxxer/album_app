import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Env? _instance;
  // Avoid self instance
  Env._();
  static Env get instance => _instance ??= Env._();

  Future<void> load() => DotEnv().load(fileName: '.env');
  String? operator [](String key) => DotEnv().env[key];
}
