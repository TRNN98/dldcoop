import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'package:dldcoop/FollowMe/models/profile/infoModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_movement.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  Param param;
  Profile(this.param);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late File _image;
  late String _img;
  // String _cremation = '';
  late String base64Image;

  // String member = '';
  final picker = ImagePicker();

  // Future<String> _getCremation() {
  //   _cremation = '';
  //   Network.fetchCremation('{"mode": "1"}', widget.token, context)
  //       .then((value) => {
  //             value.forEach(
  //               (data) => {
  //                 _cremation = '\n' + _cremation + data['crem_name'] + '\n',
  //               },
  //             ),
  //           });
  //   setState(() {
  //     _cremation = _cremation;
  //   });
  // }

  startUpload() {
    String fileName = _image.path.split('/').last;

    print(fileName);
    upload(fileName);
  }

  Future upload(String fileName) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/upload');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      // "Authorization": "Bearer " + widget.param.token
    };
    var data = '{"image": "' +
        base64Image +
        '", "name": "' +
        widget.param.membership_no +
        '"}';
    setState(() {});
    String jsons = json.encode(data);
    await http
        .post(url, headers: headers, body: json.decode(jsons))
        .then((value) {});
  }

  Future getcamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    editimg(File(pickedFile!.path));
  }

  Future getgallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    editimg(File(pickedFile!.path));
  }

  Future editimg(img) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: img.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    if (croppedFile != null) {
      _image = File(croppedFile.path);
      _img = File(croppedFile.path).path;
      setState(() {
        base64Image = base64Encode(File(croppedFile.path).readAsBytesSync());
        showimg();
      });
    } else {
      _image = File(img.path);
      _img = File(img.path).path;
      setState(() {
        showimg();
        base64Image = base64Encode(File(img.path).readAsBytesSync());
      });
    }
  }

  var ObjInfo = '{"mode": "1"}';
  var ObjInfoAddress = '{"mode": "3"}';

  late String imgprofile;

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'ออกจากแอปพลิเคชัน',
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
            ),
            content: Text(
              'คุณต้องการออกจากแอปพลิเคชัน\nใช่ หรือ ไม่',
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  'ไม่',
                  style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'ใช่',
                  style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    // _getCremation();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membership_no}.jpg';
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            // CustomTextStyle.headcolor(context, 100),
            Container(
              decoration: MyClass.backGround(context),
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode == true
                        ? displayHeight(context) * 0.20
                        : displayHeight(context) * 0.114,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: displayHeight(context) * 0.1),
                    child: Center(
                      child: CustomUI.headprofile(context, widget.param.lgs,
                          widget.param.fontsizeapps, widget.param.name),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: displayHeight(context) * 0.16),
                      child: FutureBuilder<List<InfoModel>>(
                        future: Network.fetchInfo(
                            ObjInfo, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _detail(info: snapshot.data);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return MyClass.loading();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            CustomUI.appbarBackgroundUi(context),
            CustomUI.appbarTitleUi(
                Language.profileLg('profile', widget.param.lgs),
                widget.param.fontsizeapps,
                context),
            GestureDetector(
              onTap: () {
                showd();
              },
              child: Stack(
                children: [
                  CustomUI.appbarDetailUiPro1(imgprofile, context),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.19,
                        left: displayWidth(context) * 0.15),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: displayHeight(context) * 0.05,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[50]),
                          child: Text(
                              Language.profileLg('camera', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            getcamera();
                            Navigator.of(context).pop(true);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: Text(
                              Language.profileLg('gallery', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            getgallery();
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  void showimg() {
    Uint8List bytes = base64Decode(base64Image);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: _image == null
                          ? Text('No image selected.',
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1))
                          : CircleAvatar(
                              radius: 55,
                              backgroundColor: MyColor.color('imgprofile'),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(_img),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: MemoryImage(bytes),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: Text(
                              Language.profileLg('cancel', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                              Language.profileLg('upload', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            imageCache.clear();
                            imageCache.clearLiveImages();
                            setState(() {
                              startUpload();
                            });
                            // refresh() {
                            //   setState(() {
                            //     startUpload();
                            //   });
                            // }

                            Navigator.of(context).pop(true);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pins(gettitle: 'pinCode'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget _detail({info}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          color: MyColor.color('datatitle'),
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 0),
          separatorBuilder: (context, index) => Divider(
            color: MyColor.color('linelist'),
          ),
          itemCount: info.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
              // decoration: BoxDecoration(
              //     border: Border(
              //         left: BorderSide(
              //             color: MyColor.color('LineColor'),
              //             width: tabletMode ? 8 : 6))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'member', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].membershipNo.toString()),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'status', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].memStatus.toString()),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'no_group_prename', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(info[index].memberGroupNo),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg('member_group_prename',
                                        widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].memberGroupName),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'mem_type', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(info[index].memTypeDesc),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'dateOfApprove', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].dateOfApprove.toString()),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg('dateOfRegisingation',
                                        widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].resignationApproveDate),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'ageOfmember', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].ageOfApprove.toString()),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //10
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'birthday', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].dateOfBirth.toString()),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg('age', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      info[index].ageOfBirth.toString()),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg('sex', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(info[index].sex),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    Language.profileLg(
                                        'phone', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(info[index].phone) == ''
                                      ? '-'
                                      : MyClass.checkNull(info[index].phone),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                    Language.profileLg(
                                        'address', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.subDataTxt(context, 1)),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  MyClass.checkNull(info[index].address) == ''
                                      ? '-'
                                      : MyClass.checkNull(info[index].address),
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
