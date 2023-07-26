import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/pages/InTro/pdpa.dart';
import 'package:dldcoop/FollowMe/pages/InTro/terms_conditions.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/locals/dblg.dart';
import 'package:dldcoop/FollowMe/models/sql/lgDb.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_movement.dart';
// import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  late Function goToTab;
  late DBLg dBLg;
  LGDb lg = LGDb();

  _insertlg() {
    lg.lg = '0';
    dBLg.initDB().then(
          (x) => {
            dBLg.deleteAll().then((value) => {
                  dBLg.insertLg(lg).then(
                        (l) => {},
                      ),
                })
          },
        );
  }

  @override
  void initState() {
    dBLg = DBLg();
    super.initState();
    _insertlg();

    slides.add(
      Slide(
        title: 'WELCOME\n&ยินดีต้อนรับเข้าสู่ระบบ\nบริการสมาชิกแบบออนไลน์\n&',
        description: "&",
        pathImage: "assets/imgs/tuto1.png",
      ),
    );
    slides.add(
      Slide(
        title: "Trustworthy&",
        description: "สร้างความมั่นใจในการใช้งานด้วย\nมาตรฐานระบบความปลอดภัย&",
        pathImage: "assets/imgs/tuto2.png",
      ),
    );
    slides.add(
      Slide(
        title: "Faster and Save time&",
        description:
            "ดีต่อใจ...สะดวกรวดเร็ว และ \nประหยัดเวลากว่าช่องทางอื่นๆ&",
        pathImage: "assets/imgs/tuto3.png",
      ),
    );
    slides.add(
      Slide(
        title: "Answers and Relevant&",
        description: "เป็นมากกว่าโปรแกรมสหกรณ์\nตอบโจทย์ทุกการใช้งานบนมือถือ&",
        pathImage: "assets/imgs/tuto4.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    // this.goToTab(0);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Pdpa(),
      ),
    );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: MyColor.color('Bl'),
      size: 23.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: MyColor.color('Bl'),
    );
  }

  Widget doneButtonStyle() {
    return Text('Next');
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: MyColor.color('Bl'),
    );
  }

  List<Widget> renderListCustomTabs(tabletMode) {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("assets/imgs/bg.jpg"),
              fit: tabletMode ? BoxFit.cover : BoxFit.cover),
        ),
        // margin: EdgeInsets.only(bottom: 50.0, top: 50.0),
        child: ListView(
          children: <Widget>[
            Container(),
            SizedBox(
                height: currentSlide.pathImage == tabletMode
                    ? displayHeight(context) * 0.03
                    : displayHeight(context) * 0.11),
            InkWell(
                child: Image.asset(
              currentSlide.pathImage!,
              // ใช่รูปสหกรณ์มั้ย ถ้าใช่ > ตรวจว่าใช่tabletmodeมั้ย ถ้า ใช่ > ขนาด 800 ถ้าไม่ ขนาด 250

              // ไม่ใช่ใช่รูปสหกรณ์มั้ยนี้
              width: currentSlide.pathImage == tabletMode ? 300 : 170,
              height: currentSlide.pathImage == tabletMode ? 300 : 170,
              fit: BoxFit.contain,
            )),
            Column(
              children: [
                SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.0000001
                        : displayHeight(context) * 0.02),
                Text(
                  currentSlide.title!.split('&')[0],
                  // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleTitle,
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.titleIntoTxt(
                      context, currentSlide.pathImage == tabletMode ? -15 : -6),
                  textAlign: TextAlign.center,
                ),
                Text(
                  currentSlide.title!.split('&')[1],
                  // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleTitle,
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.titleIntoTxt1(
                      context, tabletMode ? -15 : -13),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                currentSlide.description!.split('&')[0],
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.titleIntoTxt2(context, -13),
                // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleDescription,
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              child: Text(
                currentSlide.description!.split('&')[1],
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.titleIntoTxt3(context, -13),
                // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleDescription,
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              // margin: EdgeInsets.only(top: 20.0),
            ),
          ],
        ),
      ));
    }
    return tabs;
  }

  //          Center(
//                   child: Column(children: <Widget>[
//                 Container(
//                   width: 200,
//                   height: 200,
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.all(5),
//                   child: Text("test"),
//                   decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.all(),
//                       color: Colors.white,
//                       border: Border.all(
//                         color: Color(0xFF2194FF),
//                         width: 4,
//                       )),
//                 )
//               ])),

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(MyColor.color('slide2')),
      overlayColor: MaterialStateProperty.all<Color>(MyColor.color('slide1')),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _insertlg();
    return IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),
      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: MyColor.color('slide2'),
      colorActiveDot: MyColor.color('slide1'),
      sizeDot: 13.0,
      // typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(tabletMode),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      // shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}

//------------------ Default config ------------------
//class IntroScreenState extends State<IntroScreen> {
//  List<Slide> slides = new List();
//
//  @override
//  void initState() {
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "ERASER",
//        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//        pathImage: "images/photo_eraser.png",
//        backgroundColor: Color(0xfff5a623),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "PENCIL",
//        description: "Ye indulgence unreserved connection alteration appearance",
//        pathImage: "images/photo_pencil.png",
//        backgroundColor: Color(0xff203152),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "RULER",
//        description:
//        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//        pathImage: "images/photo_ruler.png",
//        backgroundColor: Color(0xff9932CC),
//      ),
//    );
//  }
//
//  void onDonePress() {
//    // Do what you want
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new IntroSlider(
//      slides: this.slides,
//      onDonePress: this.onDonePress,
//    );
//  }
//}
