import 'package:flutter/widgets.dart';

class ColorApp {
  static ColorApp? _instance;
  // Avoid self instance
  ColorApp._();
  static ColorApp get instance => _instance ??= ColorApp._();
  Color get primary => const Color(0xFF791435);
  Color get secondary => const Color(0xFFFDCD50);
  Color get yeloow => const Color(0xFFFDCD50);
  Color get grey => const Color(0xFFCCCCCC);
  Color get greyDark => const Color(0xFF999999);
}

extension ColorAppExtension on BuildContext {
  ColorApp get colors => ColorApp.instance;
}
