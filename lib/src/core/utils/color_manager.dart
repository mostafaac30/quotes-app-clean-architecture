import 'package:flutter/material.dart';

class ColorManager {
  static Color bgColor = HexColor.fromHex('#F6F6F6');
  static Color titleColor = HexColor.fromHex('#000000');
  static Color bgBlockColor = HexColor.fromHex('#FFFFFF');
  static Color black100Color = Color(0xFF03081A);
  static Color bodyText25Color = HexColor.fromHex('#AEB3C2');
  static Color bodyText60Color = Color(0xFF666A78);
  static Color border10Color = HexColor.fromHex('#E6E6E8');
  static Color yellowColor = HexColor.fromHex('#FFB800');
  static Color orangeColor = HexColor.fromHex('#FF7A00');
  static Color redColor = HexColor.fromHex('#CA2E2E');
  static Color blueColor = HexColor.fromHex('#0038FF');
  static Color greenColor = HexColor.fromHex('#0EC320');
}

extension HexColor on Color {
  static Color fromHex(String hexCode) {
    final buffer = StringBuffer();
    if (hexCode.length == 6 || hexCode.length == 7) buffer.write('FF');
    buffer.write(hexCode.replaceFirst('#', ''));
    return Color(
      int.parse(buffer.toString(), radix: 16),
    );
  }
}
