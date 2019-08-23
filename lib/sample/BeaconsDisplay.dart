import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/database/BeaconsDataBase.dart';
import 'package:untitled/database/DatabaseHelper.dart';
import 'package:untitled/model/BeaconsM.dart';
import 'package:untitled/model/Product.dart';

class BeaconsDisplay extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => beaconsDisplayState();
  }
  class beaconsDisplayState extends State<BeaconsDisplay>{


    var isLoading = false;
    Future<List<BeaconsM>> beacons;
    var dbHelper;


    @override
    void initState() {
      super.initState();
      dbHelper = BeaconsDataBase();
      refreshList();
    }

    refreshList() {
      setState(() {
        isLoading = true;
      });
      beacons = dbHelper.getAllBeacons();
      setState(() {
        isLoading = false;
      });
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text("View Beacons Data"),
        ),
        body: FutureBuilder<List>(
            future: beacons,
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
                          leading: Text("X:-"+snapshot.data[position].bpositionA.toString()),
                          title: Text(snapshot.data[position].bmac_id.toString()),
                          trailing: Text("Y:- "+snapshot.data[position].bpositionB.toString()),
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

