import 'package:flutter/material.dart';
import 'package:untitled/components/ProductView.dart';
import 'package:untitled/model/Items.dart';

class ProductWidget extends StatelessWidget {

  final Items product;

  ProductWidget({Key key, this.product}) : super(key:key);

  @override
  Widget build(BuildContext context){

    double height = MediaQuery.of(context).size.height/1.8;
    double fontSize = (height/28).round().toDouble();

    return  GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ProductView(item: this.product)));
        },
        child:
           Container(padding: EdgeInsets.fromLTRB(20, 20, 20, 5),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))), child:
             Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
               Center( child:  Image.asset(this.product.urlToImage, fit: BoxFit.cover, height: height * 0.2)),
               Container(height: height * 0.25, margin: EdgeInsets.only(top: 2), child:
                 Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                   Text("\₹${this.product.price}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: fontSize)),
                   Container(margin: EdgeInsets.only(top: 5, bottom: 10), child:  Text("${this.product.title}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: fontSize * 0.65))),
                   Text("${this.product.weight}g", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: fontSize * 0.68))
                ])
              )
            ])
          )
    );
  }

}