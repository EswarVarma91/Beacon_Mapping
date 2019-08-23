import 'package:flutter/material.dart';
import 'package:untitled/components/ProductWidgetCategory.dart';
import 'package:untitled/repositories/Categories.dart';
import 'package:untitled/model/Items.dart';

class ProductCategoriesPage extends StatefulWidget{

  @override
  _productCategories createState() => new _productCategories();
}

// ignore: camel_case_types
class _productCategories extends State<ProductCategoriesPage> {
  @override
  Widget build(BuildContext context) {

    double _gridSize = MediaQuery.of(context).size.height*0.98; //88% of screen
    double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.0);

    List<Items> _products = new Categories().fetchAllItems();
    
    return Wrap(children: <Widget>[
        new Container(height: _gridSize, decoration: BoxDecoration(color: const Color(0xFFeeeeee), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10), bottomRight: Radius.circular(_gridSize/10))), padding: EdgeInsets.only(left: 10, right: 10), child:
        new Wrap(children: <Widget>[
          new Container(margin: EdgeInsets.only(top: 10), child:
          new Wrap(children: <Widget>[
            new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
              // new CategoryDropMenu(),
              //new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.filter_list,size: 25,), label: new Text(" Select Category",textAlign:TextAlign.right,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
            ]),
            new Container(height: _gridSize - 98, margin: EdgeInsets.only(top: 0), child:
            new PhysicalModel(
                color: Colors.transparent,
                borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10 - 10), bottomRight: Radius.circular(_gridSize/10 - 10)),
                clipBehavior: Clip.antiAlias,
                child: new GridView.builder(
                    itemCount: _products.length, gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: childAspectRatio),
                    itemBuilder: (BuildContext context, int index) {
                      return new Padding(
                          padding: EdgeInsets.only(top: index%2==0 ? 20 : 0, right: index%2==0 ? 5 : 0, left: index%2==1 ? 5 : 0, bottom: index%2==1 ? 20 : 0),
                          child: ProductWidgetCategory(product: _products[index]));
                    }
                )
            )
            )
          ])
          )
        ])
        ),
      ]);
  }
}
