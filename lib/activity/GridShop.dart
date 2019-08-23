import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/activity/MainPage.dart';
import 'package:untitled/components/ProductWidget.dart';
import 'package:untitled/model/Items.dart';
import 'package:untitled/repositories/ProductsRepository.dart';

class GridShop extends StatefulWidget {
 @override
  _GridShop createState() =>  _GridShop();
}

class _GridShop extends State<GridShop> {

  @override
  Widget build(BuildContext context){

    double _gridSize = MediaQuery.of(context).size.height*0.99; //88% of screen
    double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.40);

    List<Items> _products =  ItemsRepository().fetchAllItems();

    return  Column(children: <Widget>[
        Column(children: <Widget>[
           Container(

             child: Padding(
                 padding: EdgeInsets.only(left: 0.0, top: 30.0),
                 child:  Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     IconButton(
                       icon:Icon(Icons.arrow_back),
                       color: Colors.black,
                       iconSize: 22.0,
                       onPressed: (){
                         //Navigator.pop(context);
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
                       },
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 5.0,top: 12.0),
                       child:  Text('Products',
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20.0,
                               color: Colors.black)),
                     )
                   ],
                 )),
           ),
           Container(margin: EdgeInsets.only(top: 0), child:
           Column(children: <Widget>[
             Container(height: _gridSize - 68, margin: EdgeInsets.only(left: 10.0,right: 10.0), child:
               PhysicalModel(
                  color: Colors.transparent,
                  //borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10 - 10), bottomRight: Radius.circular(_gridSize/10 - 10)),
                  clipBehavior: Clip.antiAlias,
                  child:  GridView.builder(
                      itemCount: _products.length, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: childAspectRatio),
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                            padding: EdgeInsets.only(top: index%2==0 ? 15 : 0, right: index%2==0 ? 5 : 0, left: index%2==1 ? 5 : 0, bottom: index%2==1 ? 15 : 0),
                            child: ProductWidget(product: _products[index]));
                      }
                  )
              )
            )
          ])
          )
        ])
     //  MinimalCart(_gridSize)
    ]);
  }

}