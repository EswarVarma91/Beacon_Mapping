import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/login/AskName.dart';

class OTPPage extends StatefulWidget{

  @override
  otpState createState()=>otpState();
}

// ignore: camel_case_types
class otpState extends State<OTPPage>{

  TextEditingController _controller = new TextEditingController();
  Key _k1=new GlobalKey();
  FocusNode f1 = FocusNode();

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
                child:Text("We have verified your mobile number and a verification number is sent. Enter the verification code we sent.!",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.black),),),
              SizedBox(height: 10,),
              TextFormField(
                focusNode: f1,
                showCursor: true,
                controller: _controller,
                key: _k1,
                keyboardType: TextInputType.phone,
                autofocus: false,
                maxLength: 6,
                style: TextStyle(fontSize: 22,color: Colors.blue),
                maxLines: 1,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  fillColor: Colors.blue,
                  helperText: 'Received OTP',
                  hintText: '',
                  errorStyle: TextStyle(color: Colors.red),
                  labelText: 'Verify the code ...',
                  suffixText: '',
                  contentPadding: new EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              SizedBox(height: 40,),
              RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                elevation: 4.0,
                splashColor: Colors.blueAccent,
                color: Theme.of(context).accentColor,
                child: Text('Submit' ,style: TextStyle(color: Colors.white,fontSize: 16),),
                onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => AskName()));
                },
              )],
          ),
        ),
      ),
    );
  }


}