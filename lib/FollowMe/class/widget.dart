import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:flutter/material.dart';

class MyWidget {
  static nodata(lgs, context) {
    return Center(
      child: Text(
        Language.mainLg('nodata', lgs),
        textScaleFactor: MyClass.fontSizeApp(),
        style: CustomTextStyle.nodataTxt(context, 0),
      ),
    );
  }

  static BoxDecoration bgPdpa(context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return BoxDecoration(
      image: DecorationImage(
        image: tabletMode
            ? AssetImage("assets/imgs/bg_tablet.png")
            : AssetImage("assets/imgs/bg.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }

  static BoxDecoration bgApp() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/imgs/bg.jpg"),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
