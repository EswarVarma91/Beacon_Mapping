import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/database/BeaconsDataBase.dart';
import 'package:untitled/model/BeaconsM.dart';

class BeaconsADD extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BeaconsAddState();
  }

}

class BeaconsAddState extends State<BeaconsADD>{

  TextEditingController _controller1=new TextEditingController();
  TextEditingController _controller2=new TextEditingController();
  TextEditingController _controller3=new TextEditingController();
  Future<List<BeaconsM>> products;
  var dbHelper=BeaconsDataBase();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Beacon Data'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
            ListTile(
                title: TextFormField(
                  controller: _controller1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Mac Id"
                  ),
                ),
            ),
              ListTile(
                title: TextFormField(

                  controller: _controller2,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Position A"
                  ),
                ),
              ),ListTile(
                title: TextFormField(
                  controller: _controller3,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Posotion B"
                  ),
                ),
              ),
              RaisedButton(
                onPressed: (){

                  Fluttertoast.showToast(msg: "1 "+_controller1.text.toString()+" 2 "+_controller2.text.toString()+" 3 "+_controller3.text.toString());
                  BeaconsM p=BeaconsM(_controller1.text.toString(),_controller2.text.toString(),_controller3.text.toString());
                  dbHelper.save(p);

                  setState(() {
                    _controller1.text="";
                    _controller2.text="";
                    _controller3.text="";
                  });
                },
                child: Text("Save"),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

