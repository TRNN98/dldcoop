import 'package:flutter/material.dart';

class MyColor {
  static color(data) {
    if (data.toString() == 'colorheader') {
      return Color(0xFFF5D512);
    } else if (data.toString() == 'datatitle') {
      return Colors.white.withOpacity(0.73);
    } else if (data.toString() == 'headtitle') {
      return Colors.blue;
    } else if (data.toString() == 'linelist') {
      return Colors.grey;
    } else if (data.toString() == 'TextFormFieldTextStyle') {
      return Color.fromARGB(255, 217, 217, 217);
    } else if (data.toString() == 'TextFormFieldBorderSide') {
      return Color(0xFF1E4597);
    } else if (data.toString() == 'button') {
      return Color(0xFF1E4597);
    } else if (data.toString() == 'button1') {
      return Color.fromRGBO(0, 133, 4, 1);
    } else if (data.toString() == 'buttonG') {
      return Color(0xFF0B9931);
    } else if (data.toString() == 'buttonnext') {
      return Color(0xFF000000);
    } else if (data.toString() == 'slide1') {
      return Colors.white;
    } else if (data.toString() == 'slide2') {
      return Color(0xFFF5D512);
    } else if (data.toString() == 'imgprofile') {
      return Color(0xFFF5D512);
    } else if (data.toString() == 'detailhead') {
      return Color.fromRGBO(17, 135, 254, 1);
    } else if (data.toString() == 'settings') {
      return Color(0xFFF1187fe);
    } else if (data.toString() == 'buttongra') {
      return Color.fromRGBO(31, 141, 254, 1);
    } else if (data.toString() == 'buttongra1') {
      return Color.fromRGBO(31, 141, 254, 1);
    } else if (data.toString() == 'buttongra2') {
      return Color(0xFF914721);
    } else if (data.toString() == 'buttongra3') {
      return Color(0xFFEA6724);
    } else if (data.toString() == 'tabs') {
      return Color(0x441CA7EC);
    } else if (data.toString() == 'bg') {
      return Color(0x441CA7EC);
    } else if (data.toString() == 'R') {
      return Colors.red;
    } else if (data.toString() == 'R1') {
      return Color(0xFFDFF1414);
    } else if (data.toString() == 'B') {
      return Color(0xFF1E4597);
    } else if (data.toString() == 'G') {
      return Color(0xFF1FC019);
    } else if (data.toString() == 'G1') {
      return Color(0xFF1F5F1C);
    } else if (data.toString() == 'G2') {
      return Color(0xFF2E8A2A);
    } else if (data.toString() == 'BlH') {
      return Color(0xFF262626);
    } else if (data.toString() == 'Or') {
      return Color(0xFFE85B00);
    } else if (data.toString() == 'Gr') {
      return Color(0xFF969696);
    } else if (data.toString() == 'divider') {
      return Color(0xFF000000);
    } else if (data.toString() == 'Bl') {
      return Color(0xFF000000);
    } else if (data.toString() == 'LineColor') {
      return Color(0xFF1186FE);
    } else if (data.toString() == 'LoginTxt') {
      // #024EA8
      return Color.fromARGB(255, 2, 77, 168);
    } else if (data.toString() == 'Txttitle') {
      // #023CC2
      return Color(0xFF023CC2);
    } else if (data.toString() == 'Txthead') {
      // #047AE2
      return Color(0xFF047AE2);
    } else if (data.toString() == 'SettingBackground') {
      return Colors.white.withOpacity(0.73);
    } else if (data.toString() == 'W') {
      return Color(0xFFFFFFFF);
    } else if (data.toString() == 'ButtonBl') {
      // #C0EEF2
      return Color(0xFFC0EEF2);
    } else if (data.toString() == 'settingCard') {
      // #f1fcfe
      return Color.fromARGB(255, 241, 252, 254);
    } else if (data.toString() == 'bgStatus') {
      // ##F6F5F5
      return Color(0xFFF6F5F5);
    }
  }

  static ColorLinear(data) {
    if (data.toString() == "button") {
      return <Color>[
        Color(0xFFF5D512),
        Color(0xFFF5D512),
        Color(0xFFF5D512),
      ];
    } else if (data.toString() == "button2") {
      return <Color>[
        Colors.red,
        Colors.red,
        Colors.red,
      ];
    } else if (data.toString() == "button1") {
      return <Color>[
        Colors.pink,
        Colors.pink,
        Colors.pink,
      ];
    } else if (data.toString() == "button3") {
      return <Color>[
        Colors.green,
        Colors.green,
        Colors.green,
      ];
    } else if (data.toString() == "buttoncheckrg1") {
      return <Color>[
        Color(0xFF42E974),
        Color(0xFF42E974),
        Color(0xFF189D6C),
      ];
    } else if (data.toString() == "buttoncheckrg2") {
      return <Color>[
        Color(0xFF0135E1),
        Color(0xFF0135E1),
        Color(0xFF393694),
      ];
    }
  }
}
