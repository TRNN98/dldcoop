import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_movement.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';

import 'mycolor.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MyClass {
  static checkNull(data) {
    return data.toString() == "null"
        ? ''
        : data == null
            ? ''
            : data.toString();
  }

  static cutSpaceString(s) {
    String result = s.toString();
    return result.replaceAll(" ", "");
  }

  static cutstringnewdetail(s) {
    String result = s.substring(0);
    print("_______________");
    print(result);
    return result.toString();
  }

  static adYearFormat(data) {
    return data - 543;
  }

  static formatcontactaccoutn(data) {
    var l = data.toString().length;
    var d = '';
    if (data.toString() != null) {
      if (l == 9) {
        for (var i = 0; i <= 8; i++) {
          if (i == 2) {
            d += data.split('')[i].toString() + '-';
          }
          if (i == 7) {
            d += data.split('')[i].toString() + '-';
          } else {
            d += data.split('')[i].toString();
          }
        }
      }
    } else {
      d = '';
    }
    return d;
    // return data.toString() == null ? '' : data.toString();
  }

  static formatRef(data) {
    var l = data.toString().length;
    var d = '';
    if (data.toString() != null) {
      if (l == 8) {
        for (var i = 0; i <= 7; i++) {
          if (i == 5) {
            d += data.split('')[i].toString() + '/';
          } else {
            d += data.split('')[i].toString();
          }
        }
      }
    } else {
      d = '';
    }
    return d;
    // return data.toString() == null ? '' : data.toString();
  }

  static formatcontactbank(data) {
    var l = data.toString().length;
    var d = '';
    print(data);
    if (data.toString() != null) {
      if (l == 10) {
        for (var i = 0; i <= 9; i++) {
          if (i == 2) {
            d += data.split('')[i].toString() + '-';
          } else if (i == 3) {
            d += data.split('')[i].toString() + '-';
          } else if (i == 8) {
            d += data.split('')[i].toString() + '-';
          } else {
            d += data.split('')[i].toString();
          }
        }
      }
    } else {
      d = '';
    }
    return d;
    // return data.toString() == null ? '' : data.toString();
  }

  static formatcontactloan(data) {
    var l = data.toString().length;
    var d = '';
    if (data.toString() != null) {
      if (l == 10) {
        for (var i = 0; i <= 9; i++) {
          if (i == 0) {
            d += data.split('')[i].toString() + '-';
          } else if (i == 6) {
            d += data.split('')[i].toString() + '/';
          } else if (i == 8) {
            d += data.split('')[i].toString() + '-';
          } else {
            d += data.split('')[i].toString();
          }
        }
      } else if (l == 11) {
        for (var i = 0; i <= 10; i++) {
          if (i == 0) {
            d += data.split('')[i].toString() + '-';
          } else if (i == 7) {
            d += data.split('')[i].toString() + '/';
          } else if (i == 9) {
            d += data.split('')[i].toString() + '-';
          } else {
            d += data.split('')[i].toString();
          }
        }
      }
    } else {
      d = '';
    }
    return d;
    // return data.toString() == null ? '' : data.toString();
  }

  static checkNull0(data) {
    if (data.toString() == null) {
      return '0.00';
    } else if (data.toString() == 'null') {
      return '0.00';
    } else {
      return data.toString();
    }
    // return data.toString() == null ? '0' : data.toString();
  }

  static checkPlatform() {
    if (Platform.isAndroid) {
      return true;
    } else if (Platform.isIOS) {
      return false;
    }
  }

  static FormatNumber(data) {
    try {
      double x = double.parse(data.replaceAll(',', '').toString()) % 1;
      return x > 0
          ? NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 2)
              .format(double.parse(data.replaceAll(',', '').toString() == null
                  ? ''
                  : data.replaceAll(',', '').toString()))
          : NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 2)
              .format(double.parse(data.replaceAll(',', '').toString() == null
                  ? ''
                  : data.replaceAll(',', '').toString()));
    } catch (e) {
      return '';
    }
  }

  static FormatNumberCheckTxt(data) {
    // data = '12345.00';
    double x = double.parse(data.replaceAll(',', '').toString()) % 1;
    return x > 0
        ? NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 2)
            .format(double.parse(data.replaceAll(',', '').toString() == null
                ? ''
                : data.replaceAll(',', '').toString()))
        : NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 2)
            .format(double.parse(data.replaceAll(',', '').toString() == null
                ? ''
                : data.replaceAll(',', '').toString()));
    // print(x);
    // print('dddee');
    // return data;
  }

  static company(data) {
    var th = 'สหกรณ์ออมทรัพย์กรมปศุสัตว์ จำกัด';
    var en =
        "The Department of Livestock Development Savings and Credit Cooperative Limited.";

    if (data == 'th') {
      return th;
    } else if (data == 'en') {
      return en;
    }
  }

  static showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3);
  }

  static onLoading() {
    Image.asset(cupertinoActivityIndicator, scale: 2);
  }

  static json(s) {
    return jsonDecode(jsonEncode(s));
  }

  static genmember(s) {
    var number = 7 - s.toString().length;
    for (int i = 0; i < number; i++) {
      s = '0' + s;
    }
    return s;
  }

  static lengthmember() {
    return 7;
  }

  static hiddenDialog(n, context) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  // static monthItoS(s) {
  //   var monthLong =
  //       '[[มกราคม],[กุมภาพันธ์],[มีนาคม],[เมษายน],[พฤษภาคม],[มิถุนายน],[กรกฎาคม],[สิงหาคม],[กันยายน],[ตุลาคม],[พฤศจิกายน],[ธันวาคม]}]';
  //
  //   final regExp = new RegExp(r'(?:\[)?(\[[^\]]*?\](?:,?))(?:\])?');
  //   final input = monthLong;
  //   final result = regExp
  //       .allMatches(input)
  //       .map((m) => m.group(1))
  //       .map((String? item) => item.replaceAll(new RegExp(r'[\[\],]'), ''))
  //       .map((m) => m)
  //       .toList();
  //   // print(result[index-1].toString());
  //   return result[s].toString();
  // }

  static formatDate(s) {
    String d = s.split('/')[0].toString();
    String m = s.split('/')[1].toString();
    String y = s.split('/')[2].toString();
    if (s.split('/')[0].toString().length < 2) {
      d = '0' + s.split('/')[0].toString();
    }
    if (s.split('/')[1].toString().length < 2) {
      m = '0' + s.split('/')[1].toString();
    }
    return y + '-' + m + '-' + d;
  }

  static formatDate1(s) {
    String d = s.split('/')[0].toString();
    String m = s.split('/')[1].toString();
    String y = s.split('/')[2].toString();
    if (s.split('/')[0].toString().length < 2) {
      d = '0' + s.split('/')[0].toString();
    }
    if (s.split('/')[1].toString().length < 2) {
      m = '0' + s.split('/')[1].toString();
    }
    return (int.parse(y) - 543).toString() + '-' + m + '-' + d;
  }

  static formatDateC(s) {
    String d = s.split('-')[2].toString();
    String m = s.split('-')[1].toString();
    String y = (int.parse(s.split('-')[0]) - 543).toString();

    return y + '-' + m + '-' + d;
  }

  static formatIdCard(data) {
    var id = '';
    for (var i = 0; i < 13; i++) {
      if (i == 1) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 5) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 10) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 12) {
        id += '-' + data.split('')[i].toString();
      } else {
        id += data.split('')[i].toString();
      }
    }
    return data.toString() == null ? '' : id.toString();
  }

  static formatIdCardX(data) {
    var id = '';
    for (var i = 0; i < 13; i++) {
      if (i == 1) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 5) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 10) {
        id += '-' + 'x';
      } else if (i == 11 || i == 9 || i == 8) {
        id += 'x';
      } else if (i == 12) {
        id += '-' + 'x';
      } else {
        id += data.split('')[i].toString();
      }
    }
    return data.toString() == null ? '' : id.toString();
  }

  static versionApp() {
    String ios = '1.00';
    String android = '1.00';
    if (Platform.isIOS) {
      return ios;
    } else if (Platform.isAndroid) {
      return android;
    }
  }

  static hostApp() {
    return "https://apimobile.munsaving.com";
  }

  static formatNumberPhoneI(phoneNumberString) {
    return phoneNumberString.toString().replaceAll('-', '').replaceAll(',', '');
  }

  static formatNumberPhoneS(phoneNumberString) {
    var n = '';
    if (phoneNumberString.toString().length == 9) {
      for (var i = 0; i < 9; i++) {
        if (i == 1) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else if (i == 5) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else {
          n += phoneNumberString.split('')[i].toString();
        }
      }
    } else if (phoneNumberString.toString().length == 10) {
      for (var i = 0; i < 10; i++) {
        if (i == 3) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else if (i == 6) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else {
          n += phoneNumberString.split('')[i].toString();
        }
      }
    } else {
      n = '';
    }

    return n.toString() == null ? '' : n.toString();
  }

  static formatNumberPhoneX(phoneNumberString) {
    var x =
        phoneNumberString.toString().replaceAll('-', '').replaceAll(',', '');
    var n = '';
    if (x.toString().length == 10) {
      for (var i = 0; i < 10; i++) {
        if (i == 2) {
          n += 'x';
        } else if (i == 3) {
          n += '-' + 'x';
        } else if (i == 4 || i == 5) {
          n += 'x';
        } else if (i == 6) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else {
          n += phoneNumberString.split('')[i].toString();
        }
      }
    } else {
      n = 'รูปแบบแบอร์ผิด';
    }

    return n.toString() == null ? '' : n.toString();
  }

  static loading() {
    // return colactionloading(2);
    return const SpinKitChasingDots(
      color: Colors.white,
      // size: 50.0,
    );
  }

  static colactionloading(index) {
    List a = [
      const SpinKitRotatingCircle(color: Colors.white),
      //0
      const SpinKitRotatingPlain(color: Colors.orange),
      //1
      const SpinKitChasingDots(color: Colors.green),
      //2
      const SpinKitPumpingHeart(color: Colors.white),
      //3
      const SpinKitPulse(color: Colors.white),
      //4
      const SpinKitDoubleBounce(color: Colors.white),
      //5
      const SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
      //6
      const SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
      //7
      const SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
      //8
      const SpinKitThreeBounce(color: Colors.white),
      //9
      const SpinKitWanderingCubes(color: Colors.white),
      //10
      const SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle),
      //11
      const SpinKitCircle(color: Colors.white),
      //12
      const SpinKitFadingFour(color: Colors.white),
      //13
      const SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
      //14
      const SpinKitFadingCube(color: Colors.white),
      //15
      const SpinKitCubeGrid(size: 51.0, color: Colors.green),
      //16
      const SpinKitFoldingCube(color: Colors.white),
      //17
      const SpinKitRing(color: Colors.white),
      //18
      const SpinKitDualRing(color: Colors.white),
      //19
      const SpinKitRipple(color: Colors.white),
      //20
      const SpinKitFadingGrid(color: Colors.white),
      //21
      const SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
      //22
      const SpinKitHourGlass(color: Colors.white),
      //23
      const SpinKitSpinningCircle(color: Colors.white),
      //24
      const SpinKitSpinningCircle(
          color: Colors.white, shape: BoxShape.rectangle),
      //25
      const SpinKitFadingCircle(color: Colors.white),
      //26
      // SpinKitPouringHourglass(color: Colors.green) //27
    ];
    return a[index];
    //https://pub.dev/packages/flutter_spinkit
  }

  static fontSizeApp() {
    // const pref_fontsize = 'fontsize';

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var fontsizes = preferences.getDouble(pref_fontsize) ?? 1.0;
    // return fontsizes;
    // // SharedPreferences prefs = await SharedPreferences.getInstance();
    // // double counter = (prefs.getDouble('size') ?? 0) + 1;
    // // print('Pressed $counter times.');

    // // ((_value * 1.5) / 100) + 0.5
    return 1.0;
  }

  static blocFontSizeApp(n) {
    // FontSizeAppBloc _fontSizeAppBloc =
    //     BlocProvider.of<FontSizeAppBloc>(context);

    // BlocBuilder(
    //     cubit: _fontSizeAppBloc,
    //     builder: (context, state) {
    //       if (state is LoadedFontSizeAppState) {
    //         print(state.fontsize);
    //         // return state.fontsize;
    //       }
    //     });

    return n;
  }

  static getFontsharedPref() async {
    // const pref_fontsize = 'fontsize';
    //
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // double fontsizes = preferences.getDouble(pref_fontsize) ?? 0.9;
    // return fontsizes;
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int) {
      return 0.0 + value;
    } else {
      return value;
    }
  }

  static tabletMode(context) {
    return MediaQuery.of(context).size.width > 600;
  }

  static backGround(context) {
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

  static splash() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/imgs/bg.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  static convertDate(date) {
    try {
      int yy;
      var y = date.split('-')[0].toString();
      var m = date.split('-')[1].toString();
      var d = date.split('-')[2].toString();
      yy = int.parse(y) + 543;
      return d + ' ' + monthNameTH(m, 'notfull') + ' ' + yy.toString();
    } catch (e) {
      return '-';
    }
  }

  static monthNameTH(m, t) {
    var th = '';
    m = int.parse(m).toString();
    if (m == '1') {
      t == 'full' ? th = 'มกราคม' : th = 'ม.ค.';
    } else if (m == '2') {
      t == 'full' ? th = 'กุมภาพันธ์' : th = 'ก.พ.';
    } else if (m == '3') {
      t == 'full' ? th = 'มีนาคม' : th = 'มี.ค.';
    } else if (m == '4') {
      t == 'full' ? th = 'เมษายน' : th = 'เม.ย.';
    } else if (m == '5') {
      t == 'full' ? th = 'พฤษภาคม' : th = 'พ.ค.';
    } else if (m == '6') {
      t == 'full' ? th = 'มิถุนายน' : th = 'มิ.ย.';
    } else if (m == '7') {
      t == 'full' ? th = 'กรกฎาคม' : th = 'ก.ค.';
    } else if (m == '8') {
      t == 'full' ? th = 'สิงหาคม' : th = 'ส.ค.';
    } else if (m == '9') {
      t == 'full' ? th = 'กันยายน' : th = 'ก.ย.';
    } else if (m == '10') {
      t == 'full' ? th = 'ตุลาคม' : th = 'ต.ค.';
    } else if (m == '11') {
      t == 'full' ? th = 'พฤศจิกายน' : th = 'พ.ย.';
    } else if (m == '12') {
      t == 'full' ? th = 'ธันวาคม' : th = 'ธ.ค.';
    }
    return th;
  }
}
