import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/activity/ProfilePage.dart';
import 'package:untitled/sample/BeaconsADD.dart';
import 'package:untitled/sample/BeaconsDisplay.dart';
import 'package:untitled/cart/ProductCart.dart';


class CommonDrawer extends StatefulWidget {
  @override
  _commonDrawer createState() => new _commonDrawer();
}
// ignore: camel_case_types
class _commonDrawer extends State<CommonDrawer>{

  String nameA =" ",mobileNumberA=" ";

  _commonDrawer() {
    getName().then((val) =>
        setState(() {
          nameA = val;
        }));
    getMobileNumber().then((val) =>
        setState(() {
          mobileNumberA = val;
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

  @override
  Widget build(BuildContext context) {
        return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              nameA,
            ),
            accountEmail: Text(
              mobileNumberA,
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage('assets/images/fluttericon.png'),
            ),
          ),
          new ListTile(
            title: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            onTap: (){
              prefix0.Navigator.pop(context);
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>ProfilePage()));
              //Toast.show('Profile', context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            },
          ),
          new ListTile(
            title: Text(
              "Your Orders",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            onTap: (){
              prefix0.Navigator.pop(context);
              Fluttertoast.showToast(msg: "Your Orders");
            },
          ),
          ListTile(
            title: Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            onTap: (){
              prefix0.Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductCart()));
              //ProductCart();
            },
          ),
          ListTile(
            title: Text(
              "Beacons Data",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            onTap: (){
              prefix0.Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BeaconsADD()));
              //ProductCart();
            },
          ),
          ListTile(
            title: Text(
              "Beacons Display",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            onTap: (){
              prefix0.Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BeaconsDisplay()));
              //ProductCart();
            },
          ),

          Divider(),
          new ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
            onTap: (){
              Fluttertoast.showToast(msg: "Settings");
            },
          ),
          Divider(),
// MyAboutTile()
        ],
      ),
    );
  }

}

