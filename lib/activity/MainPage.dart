import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/activity/ProductCategoriesPage.dart';
import 'package:untitled/common/CommonDrawer.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController = new ScrollController();

  @override
  initState(){
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return WillPopScope(
      // ignore: missing_return
      onWillPop: (){
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        drawer: CommonDrawer(),
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Stack(
          children: <Widget>[
            CustomScrollView(physics: NeverScrollableScrollPhysics(), controller: _scrollController, slivers: <Widget>[
              SliverToBoxAdapter(
                  child: ProductCategoriesPage()
              ),
            ]),
          ],
        ),
      ),
    );
  }//9741374280
}