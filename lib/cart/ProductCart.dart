import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/cart/BluetoothCheck.dart';
import 'package:untitled/database/DatabaseHelper.dart';
import 'package:untitled/model/Product.dart';

class ProductCart extends StatefulWidget {
  @override
  productPage createState() => productPage();
}
// ignore: camel_case_types
class productPage extends State<ProductCart> with TickerProviderStateMixin {
  var isLoading = false;
  Future<List<Product>> products;
  String name, price;
  DatabaseHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    refreshList();
  }

  refreshList() {
    setState(() {
      isLoading = true;
    });
    products = dbHelper.getAllProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BluetoothCheck()));
        },
        label:  Text("Start Finding"),
        icon: Icon(Icons.search),
      ),
      body: FutureBuilder<List>(
          future: products,
          initialData: List(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int position) {
                      //snapshot.data[position].name
                      return Card(
                        elevation: 5.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: ListTile(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: BoxDecoration(
                                    border:
                                    Border(right: BorderSide(width: 1.0, color: Colors.red))),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    dbHelper.delete(snapshot.data[position].id);
                                    //Navigator.pop(context);
                                    refreshList();
                                  },
                                ),
                              ),
                              title: Text(
                                snapshot.data[position].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Wrap(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(top: 5, bottom: 5),
                                      child: Text(
                                        "Quantity :" + snapshot.data[position].weight + "",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  /*Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child:  Text('Price: ₹'+snapshot.data[position].price, style: TextStyle(color: Colors.black)),
                          ),*/
                                ],
                              ),
                              //trailing: Icon(Icons.edit, color: Colors.blue, size: 30.0),
                            )),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
