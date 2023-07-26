import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/models/news/newsModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

double _fontsizeapps = 1.0;

class NewsDetail extends StatefulWidget {
  Param param;
  NewsModel newdata;

  NewsDetail({required this.newdata, required this.param});

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  String kHtml = '''  ''';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                tabletMode ? hSizedBox(context, 50) : hSizedBox(context, 30),
                Container(
                  padding: EdgeInsets.only(bottom: paddinglist(context, 0)),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _detail(),
                  ),
                ),
              ],
            ),
          ),

          CustomUI.appbarUi3(Language.newsLg('news', widget.param.lgs),
              widget.param.fontsizeapps, context),
          // CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
          // CustomUI.appbarUi(),
        ],
      ),
    );
  }

  Widget _detail() => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left:
                      BorderSide(color: MyColor.color('LineColor'), width: 6))),
          child: Scrollbar(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              separatorBuilder: (context, index) => Divider(
                color: MyColor.color('linelist'),
              ),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                // print(div[index]);
                return Container(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.newdata.question.toString(),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleTxt(context, 3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          // child: Hero(
                          //   tag: 'imageHero',
                          child: Image.network(
                            'http://dldcoop.com/' +
                                widget.newdata.nphoto.toString(),
                            height: displayHeight(context) * 0.2,
                            width: displayWidth(context) * 1,
                          ),
                          // ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return DetailScreen(
                                url: 'http://dldcoop.com/' +
                                    widget.newdata.nphoto.toString(),
                              );
                            }));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: widget.newdata.note == null
                            ? Text('')
                            : HtmlWidget(
                                '''${widget.newdata.note}''',
                                textStyle:
                                    CustomTextStyle.defaultTxt(context, 0),
                                customStylesBuilder: (element) {
                                  if (element.classes.contains('')) {
                                    return {'color': 'red'};
                                  }

                                  return null;
                                },
                                webView: true,
                              ),
                      ),
                      widget.newdata.ndata != null
                          ? widget.newdata.ndata != ''
                              ? _checkloadfile()
                              : const Padding(
                                  padding: EdgeInsets.all(8),
                                )
                          : const Padding(
                              padding: EdgeInsets.all(8),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );

  Padding _checkloadfile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => {
              _launchURL(
                  'http://dldcoop.com/' + widget.newdata.ndata.toString())
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.5, color: MyColor.color('B')),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.file_download,
                    color: Colors.black,
                  ),
                  Text(
                    Language.newsLg('load', widget.param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, -1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String url;

  DetailScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          // child: Hero(
          // tag: 'imageHero',
          child: PhotoView(
            imageProvider: NetworkImage(url),
          ),
          // ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}
