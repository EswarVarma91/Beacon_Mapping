import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/activity/GridShop.dart';

class ProductDetailsPage extends StatefulWidget{


  @override
  _productdetailPage createState()=>_productdetailPage();
}
// ignore: camel_case_types
class _productdetailPage extends State<ProductDetailsPage>{

    ScrollController _scrollController = new ScrollController();

    @override
    initState(){
      _scrollController = new ScrollController();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(backgroundColor:const  Color(0xFFeeeeee),
        body: Stack(children: <Widget>[
          CustomScrollView(physics: NeverScrollableScrollPhysics(), controller: _scrollController, slivers: <Widget>[
            SliverToBoxAdapter(
                child: GridShop()
            ),
          ]),
        ]),);
  }

}