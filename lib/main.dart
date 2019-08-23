import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:untitled/activity/MainPage.dart';
import 'package:untitled/login/MobileNumber.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    /*SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);*/
    return MaterialApp(
      title: 'E Commerce',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Nunito'),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _Splash createState() => new _Splash();
}

class _Splash extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: CheckUser(),
        title: new Text('Welcome to E Shopping Cart'),
        image: new Image.asset('assets/images/fluttericon.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 60.0,
        loaderColor: Colors.blue);
  }
}

class CheckUser extends StatefulWidget {
  @override
  _CheckUser createState() => new _CheckUser();
}

class _CheckUser extends State<CheckUser> {
  @override
  void initState() {
    super.initState();
    this.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future<void> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name');
    if (name == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  // ignore: missing_return
  Future<bool> _onBackPressed() {
    SystemNavigator.pop();
  }

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "ANDROID",
        styleTitle: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac scelerisque leo. ",
        styleDescription: TextStyle(
          color: Colors.blue,
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
        ),
        pathImage: "assets/images/fluttericon.png",
      ),
    );
    slides.add(
      new Slide(
        title: "IOS",
        styleTitle: TextStyle(
            color: Colors.blue,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac scelerisque leo. ",
        styleDescription: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/fluttericon.png",
      ),
    );
    slides.add(
      new Slide(
        title: "BLACK BERRY",
        styleTitle: TextStyle(
            color: Colors.blue,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac scelerisque leo. ",
        styleDescription: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/fluttericon.png",
      ),
    );

    slides.add(
      new Slide(
        title: "BLACK BERRY",
        styleTitle: TextStyle(
            color: Colors.blue,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac scelerisque leo. ",
        styleDescription: TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
        ),
        pathImage: "assets/images/fluttericon.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MobileNumber()));
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 25.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.blue,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.only(left: 0.0, right: 0.0),
        child: IntroSlider(
          slides: this.slides,
          // Skip button
          renderSkipBtn: this.renderSkipBtn(),
          colorSkipBtn: Colors.white,
          highlightColorSkipBtn: Colors.white,

          // Next button
          renderNextBtn: this.renderNextBtn(),

          // Done button
          renderDoneBtn: this.renderDoneBtn(),
          onDonePress: this.onDonePress,
          colorDoneBtn: Colors.blue,
          highlightColorDoneBtn: Colors.blue,

          // Dot indicator
          colorDot: Colors.blue,
          sizeDot: 6.0,
          typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

          // Tabs
          listCustomTabs: this.renderListCustomTabs(),
          backgroundColorAllSlides: Colors.white,
          refFuncGoToTab: (refFunc) {
            this.goToTab = refFunc;
          },
          shouldHideStatusBar: false,

          // On tab change completed
          onTabChangeCompleted: this.onTabChangeCompleted,
        ),
      )),
    );
  }
}
