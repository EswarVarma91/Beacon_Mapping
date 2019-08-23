import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/login/OTPPage.dart';

class MobileNumber extends StatefulWidget{

  @override
  mobileState createState()=>mobileState();
}

// ignore: camel_case_types
class mobileState extends State<MobileNumber>{

  TextEditingController _controller = new TextEditingController();
  Key _k1=new GlobalKey();
  bool isEnabled=false;
  FocusNode f1 = FocusNode();

  @override
  void initState() {
    
    super.initState();
    _controller.addListener(_printLatestValue);
  }
  _printLatestValue() {
    if(_controller.text.length==10)

    print("Second text field: ${_controller.text}");
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70,),
              Padding(
                padding: EdgeInsets.all(5.0),
                child:  Text("Let's set up your account",style: TextStyle(fontSize: 25,color: Colors.blue) ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding:EdgeInsets.all(10.0),
                  child:Text("We'll send an SMS Message to verify your identity, Please enter your number right below.!",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.black),),),
              SizedBox(height: 10,),
              TextFormField(
                focusNode: f1,
                showCursor: true,
                controller: _controller,
                key: _k1,
                keyboardType: TextInputType.phone,
                autofocus: false,
                maxLength: 10,
                style: TextStyle(fontSize: 22,color: Colors.blue),
                maxLines: 1,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  fillColor: Colors.blue,
                  helperText: 'Your Mobile',
                  hintText: '',
                  errorStyle: TextStyle(color: Colors.red),
                  labelText: 'My Mobile is ...',
                  suffixText: '',
                  contentPadding: new EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
          SizedBox(height: 30,),
          RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
            elevation: 4.0,
            splashColor: Colors.blueAccent,
            color: Theme.of(context).accentColor,
            child: Text('Verify Phone' ,style: TextStyle(color: Colors.white,fontSize: 16),),
            onPressed: (){
             if((_controller.text).length==10){
               _write(_controller.text);
              Navigator.push(context, CupertinoPageRoute(builder: (context) => OTPPage()));
            }else
              {
               Fluttertoast.showToast(msg: 'Your Mobile Number Please..');
             }
            },
          )],
          ),
        ),
      ),
    );
  }
  void _write(String text) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("number", text);
  }

}