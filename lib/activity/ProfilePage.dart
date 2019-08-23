import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/activity/MainPage.dart';


class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {

  String nameA ="Enter Name ",mobileNumberA=" Enter Mobile Number ",stateA=" Enter State ",emailidA=" Enter the EmailId",pincodeA="Enter the Pincode ";

  var nameC,emailC,mobileC,pincodeC,stateC= TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }
// Data Retrive from Sharedpreferences ==START==========
  getData() {
    getName().then((val) =>
        setState(() {
          nameA = val;
          nameC=TextEditingController(text: nameA);

        }));
    getMobileNumber().then((val) =>
        setState(() {
          mobileNumberA = val;
          mobileC=TextEditingController(text: mobileNumberA);
        }));
  getState().then((val) =>
        setState(() {
          stateA = val;
          stateC=TextEditingController(text: stateA);
        }));
   getEmailId().then((val) =>
        setState(() {
          emailidA = val;
          emailC=TextEditingController(text: emailidA);
        }));
  getpinCode().then((val) =>
        setState(() {
          pincodeA = val;
          pincodeC=TextEditingController(text: pincodeA);
        }));
  }

  Future<String> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString("name");
    return user;
  }
  Future<String> getMobileNumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString("number");
    return user;
  }
  Future<String> getState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString("state");
    return user;
  }
  Future<String> getEmailId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString("email");
    return user;
  }
  Future<String> getpinCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString("pincode");
    return user;
  }
  //==========================END=====================
  
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:  Container(
          color: Colors.white,
          child:  ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                   Container(
                    height: 250.0,
                    color: Colors.white,
                    child:  Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 0.0, top: 5.0),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                 IconButton(
                                  icon:Icon(Icons.arrow_back),
                                  color: Colors.black,
                                  iconSize: 22.0,
                                  onPressed: (){
                                    //Navigator.pop(context);
                                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => MainPage()));
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0,top: 12.0),
                                  child:  Text('Profile',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.black)),
                                )
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child:  Stack(fit: StackFit.loose, children: <Widget>[
                             Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                 Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration:  BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:  DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/as.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                     CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 25.0,
                                      child:  IconButton(
                                        icon:Icon(Icons.camera_alt,color: Colors.white,),
                                        onPressed: (){
                                         // _onImageButtonPressed(ImageSource.gallery);
                                        },
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                   Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 0.0),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                       Text(
                                        'Parsonal Information',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() :  Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                       Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                   Flexible(
                                    child:  TextFormField(
                                      controller: nameC,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Your Name",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                       Text(
                                        'Email ID',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                   Flexible(
                                    child:  TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailC,
                                      decoration: const InputDecoration(
                                          hintText: "Enter Email ID"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                       Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                   Flexible(
                                    child:  TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: mobileC,
                                      maxLength: 10,
                                      decoration: const InputDecoration(
                                          hintText: "Enter Mobile Number"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 5.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Pincode',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child:  TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: pincodeC,
                                      maxLength: 6,
                                      decoration: const InputDecoration(
                                          hintText: "Enter Pincode"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 5.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'State',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child:  TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: stateC,
                                      decoration: const InputDecoration(
                                          hintText: "Enter State"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          !_status ? _getActionButtons() :  Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    nameC.dispose();
    emailC.dispose();
    pincodeC.dispose();
    stateC.dispose();
    mobileC.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child:  RaisedButton(
                    child:  Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      _write(nameC.text,emailC.text,mobileC.text,pincodeC.text,stateC.text);
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus( FocusNode());
                      });
                    },
                    shape:  RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child:  RaisedButton(
                    child:  Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus( FocusNode());
                      });
                    },
                    shape:  RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }


// Edit Icon Code
  Widget _getEditIcon() {
    return  GestureDetector(
      child:  CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 14.0,
        child:  Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }


// Update all the data of profile in Sharedpreferences
  void _write(String name,String  email,String  phone,String  pinc, String state) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.setString("number", phone);
    preferences.setString("pincode", pinc);
    preferences.setString("state", state);
  }
  
}
