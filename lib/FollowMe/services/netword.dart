import 'dart:convert';
import 'package:dldcoop/FollowMe/models/auth/pinJson.dart';
import 'package:dldcoop/FollowMe/models/deposit/depModel.dart';
import 'package:dldcoop/FollowMe/models/deposit/depModelH.dart';
import 'package:dldcoop/FollowMe/models/deposit/depiDetailModel.dart';
import 'package:dldcoop/FollowMe/models/dividend/divDetailModel.dart';
import 'package:dldcoop/FollowMe/models/dividend/divModel.dart';
import 'package:dldcoop/FollowMe/models/gain/gainModel.dart';
import 'package:dldcoop/FollowMe/models/guarantee/guaranteeModel.dart';
import 'package:dldcoop/FollowMe/models/kept/keptDetailModel.dart';
import 'package:dldcoop/FollowMe/models/kept/keptModel.dart';
import 'package:dldcoop/FollowMe/models/loan/loanModel.dart';
import 'package:dldcoop/FollowMe/models/loan/loanModel_G.dart';
import 'package:dldcoop/FollowMe/models/loan/loanModle_D.dart';
import 'package:dldcoop/FollowMe/models/memberref/memberrefModel.dart';
import 'package:dldcoop/FollowMe/models/news/msgModel.dart';
import 'package:dldcoop/FollowMe/models/news/newsModel.dart';
import 'package:dldcoop/FollowMe/models/offset/offsetModel.dart';
import 'package:dldcoop/FollowMe/models/offset/offsetModel_D.dart';
import 'package:dldcoop/FollowMe/models/offset/offsetModel_H.dart';
import 'package:dldcoop/FollowMe/models/profile/infoModel.dart';
import 'package:dldcoop/FollowMe/models/share/shareModel_D.dart';
import 'package:dldcoop/FollowMe/models/share/shareModel_h.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/models/auth/authJson.dart';
import 'package:dldcoop/FollowMe/models/location/addressJson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Interest/InterestModel.dart';
import '../models/gain/gainModelH.dart';
import '../models/kept_special/keptSpecialModel.dart';
import '../models/loan_request/LoanRequestModel.dart';
import '../models/lock/lockPinModel.dart';
import '../models/receive_doc/receive_docModel.dart';

class Network {
  static Future fetchMsgStatusdel(data, token, context) async {
    try {
      final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/msg');
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer " + token
      };
      String jsons = json.encode(data);
      final response =
          await http.post(url, headers: headers, body: json.decode(jsons));

      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        return 'NoData';
        // throw Exception('Failed to load post');
      }
    } catch (error) {
      return 'NoData';
    }
  }

  static Future fetchAuthCount(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/auths');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);

      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<List<LockPinModel>> fetchLockPin(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/auths');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<LockPinModel> result =
          jsonResponse.map((i) => LockPinModel.fromJson(i)).toList();
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<List<AuthModel>> fetchAuth(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/auths');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AuthModel> result =
          jsonResponse.map((i) => AuthModel.fromJson(i)).toList();
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future fetchpdpa(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/pdpa');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {}
  }

  static Future<List<AuthRegitModel>> fetchAuthReg(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/auths');
    print(data);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    print(response.body);
    print("fetchAuthReg");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AuthRegitModel> result =
          jsonResponse.map((i) => AuthRegitModel.fromJson(i)).toList();
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future fetchpinlogin(data, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/auth/login');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse;
    } else {
      return 'NoData';
    }
  }

  static Future fetchpinrefresh(data, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/auth/refresh');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    List jsonResponse = [];
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse;
    } else {
      // jsonResponse = json.decode('[' + response.body + ']');
      // if (jsonResponse[0]['error'] == 'invalid_request') {
      //   MyClass.showToast(Language.pinLg('checkapplogin', 'th'));
      //   Future.delayed(Duration(seconds: 0), () {
      //     Navigator.of(context, rootNavigator: true).pop('dialog');
      //     Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => Login(),
      //       ),
      //     );
      //   });
      // }
    }
  }

  static Future fetchpinloginInfo(data, token) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/info');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      return 'NoData';
      // throw Exception('Failed to load post');
    }
  }

  static Future fetchAuthFo(data) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/auth/forgetMobiles');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      return jsonResponse;
    } else {
      return 'NoData';
    }
  }

  static Future fetchAuthRe(data) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/auth/registerMobiles');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse;
    } else {
      return 'NoData';
    }
  }

  static Future<List<ShareModelD>> fetchShare(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/share');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    final jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<ShareModelD> result =
          jsonResponse.map((i) => ShareModelD.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<ShareModelH>> fetchHeadShare(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/share');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<ShareModelH> result =
          jsonResponse.map((i) => ShareModelH.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<OffsetModelH>> fetchOffsetDetailH(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/keptclr');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    var response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<OffsetModelH> result =
          jsonResponse.map((i) => OffsetModelH.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<OffsetModelD>> fetchOffsetDetail(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/keptclr');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    var response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<OffsetModelD> result =
          jsonResponse.map((i) => OffsetModelD.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<OffsetModel>> fetchOffset(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/keptclr');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    var response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<OffsetModel> result =
          jsonResponse.map((i) => OffsetModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<DepModel>> fetchDep(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/dep');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    var response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<DepModel> result =
          jsonResponse.map((i) => DepModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
    throw Exception('Failed');
  }

  static Future<List<DepModelH>> fetchDepH(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/dep');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    var response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<DepModelH> result =
          jsonResponse.map((i) => DepModelH.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
    throw Exception('Failed');
  }

  static Future<List<DepiDetailModel>> fetchDepMovement(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/dep');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<DepiDetailModel> result =
          jsonResponse.map((i) => DepiDetailModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<LoanModel>> fetchLoan(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/lon');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<LoanModel> result =
          jsonResponse.map((i) => LoanModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
    throw Exception('Failed');
  }

  static Future<List<LoanModelG>> fetchLoanGuarantee(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/lon');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<LoanModelG> result =
          jsonResponse.map((i) => LoanModelG.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<LoanModleD>> fetchLoanMovement(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/lon');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<LoanModleD> result =
          jsonResponse.map((i) => LoanModleD.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<GuaranteeModel>> fetchGuarantee(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/mem_coll');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<GuaranteeModel> result =
          jsonResponse.map((i) => GuaranteeModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<DivModel>> fetchDividend(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/div');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<DivModel> result =
          jsonResponse.map((i) => DivModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<DivDetailModel>> fetchDividendDetail(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/div');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<DivDetailModel> result =
          jsonResponse.map((i) => DivDetailModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<DivDetailModel>> fetchDividendDetailH(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/div');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<DivDetailModel> result =
          jsonResponse.map((i) => DivDetailModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<KeptModel>> fetchKept(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/kept');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<KeptModel> result =
          jsonResponse.map((i) => KeptModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<KeptSpecial>> fetchKeptSpecial(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/kept_special');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<KeptSpecial> result =
          jsonResponse.map((i) => KeptSpecial.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<LoanRequest>> fetchLoanRequest(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/loan_request');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    final jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<LoanRequest> result =
          jsonResponse.map((i) => LoanRequest.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<KeptDetailModel>> fetchKeptDetail(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/kept');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<KeptDetailModel> result =
          jsonResponse.map((i) => KeptDetailModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<GainModelH>> fetchGainH(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/gain');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<GainModelH> result =
          jsonResponse.map((i) => GainModelH.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<GainModel>> fetchGain(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/gain');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<GainModel> result =
          jsonResponse.map((i) => GainModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<ReceiveDoc>> fetchReceiveDoc(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/receive_docno');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    final jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<ReceiveDoc> result =
          jsonResponse.map((i) => ReceiveDoc.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<MemberRefModel>> fetchMemberRef(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/mem_ref');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<MemberRefModel> result =
          jsonResponse.map((i) => MemberRefModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<InfoModel>> fetchInfo(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/info');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);

      List<InfoModel> result =
          jsonResponse.map((i) => InfoModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<NewsModel>> fetchNews(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/msg');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<NewsModel> result =
          jsonResponse.map((i) => NewsModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future fetchMsgStatus(data, token, context) async {
    try {
      final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/msg');
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer " + token
      };
      String jsons = json.encode(data);
      final response =
          await http.post(url, headers: headers, body: json.decode(jsons));
      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        return 'NoData';
        // throw Exception('Failed to load post');
      }
    } catch (error) {
      return 'NoData';
    }
  }

  static Future<List<MsgModel>> fetchMsg(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/msg');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<MsgModel> result =
          jsonResponse.map((i) => MsgModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future fetchSendOtp(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/send_otp');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List result =
          json.decode('[' + response.body.replaceAll('{}', '') + ']');
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future fetchVerifyOtp(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/verify_otp');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List result =
          json.decode('[' + response.body.replaceAll('{}', '') + ']');
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future fetchDeviceStatus(data, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/deviceFollowMeStatus');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  //
  // static Future fetchCremation(data, token, context) async {
  //   final url = '${MyClass.hostApp()}/api/v1/cremation';
  //
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": "Bearer " + token
  //   };
  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode(response.body);
  //     return jsonResponse;
  //   } else {
  //     // return 'NoData';
  //     // throw Exception('Failed to load post');
  //   }
  // }
  //
  static Future fetchVersions(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/versions');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      // return 'NoData';
      // throw Exception('Failed to load post');
    }
  }

  //
  // static Future fetchSystemClose(data) async {
  //   final url = '${MyClass.hostApp()}/api/v1/systemclose';
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8'
  //   };
  //
  //   String jsons = json.encode(data);
  //   final response =
  //   await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode(response.body);
  //     return jsonResponse;
  //   } else {
  //     // return 'NoData';
  //     // throw Exception('Failed to load post');
  //   }
  // }
  //
  static Future fetchCheckpassword(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/checkfogetpassword');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse[0]['checkforget'];
    } else {
      return '0';
      // throw Exception('Failed to load post');
    }
  }

  static Future<List<AddressModel>> fetchAddress(data, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/address');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AddressModel> result =
          jsonResponse.map((i) => AddressModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future<List<InterestModel>> fetchInterest(data, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/interest');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<InterestModel> result =
          jsonResponse.map((i) => InterestModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  static Future fetchToken(data, token) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/coop/oauth/token');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      List<PinModel> result =
          jsonResponse.map((i) => PinModel.fromJson(i)).toList();
      return result;
    } else {
      return [];
    }
  }

  static Future fetchGetTel(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/gettel');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future fetchAuthCheckOtpUnlock(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/auths');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);

      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
