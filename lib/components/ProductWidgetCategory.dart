
import 'package:flutter/material.dart';
import 'package:untitled/activity/ProductDetailsPage.dart';
import 'package:untitled/model/Items.dart';

class ProductWidgetCategory extends StatelessWidget {

  final Items product;

  ProductWidgetCategory({Key key, this.product}) : super(key:key);

  @override
  Widget build(BuildContext context){

    double height = MediaQuery.of(context).size.height/1.4;
    double fontSize = (height/28).round().toDouble();

    return new GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new ProductDetailsPage()));
        },
        child:
        new Container(padding: EdgeInsets.fromLTRB(20, 20, 20, 5),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))), child:
        new Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          new Center(child: new Hero(tag: "tagHero${this.product.id}", child: new Image.asset(this.product.urlToImage, fit: BoxFit.cover, height: height * 0.15))),
          new Container(height: height * 0.05, margin: EdgeInsets.only(top: 10), child:
          new Column(mainAxisAlignment: MainAxisAlignment.center,  children: <Widget>[
            new Center( child: new Text("${this.product.title}",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: fontSize * 0.75))),
          ])
          )
        ])
        )
    );
  }

}