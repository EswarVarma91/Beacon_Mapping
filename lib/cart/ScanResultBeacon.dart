import 'dart:async';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:untitled/cart/MyPainter.dart';
import 'package:untitled/database/BeaconsDataBase.dart';
import 'package:untitled/model/BeaconsM.dart';
import 'package:untitled/model/MeetingPoints.dart';
import 'package:untitled/model/SortBlue.dart';
import 'dart:math' as math;



class ScanResultBeacon extends StatefulWidget {
  final ScanResult result;

  ScanResultBeacon({this.result});

  @override
  State<StatefulWidget> createState() => ScanResultBeaconState(result:result);
}

class ScanResultBeaconState extends State<ScanResultBeacon> {
  ScanResult result;

  ScanResultBeaconState({this.result});

  List<Map<String, String>> minDevicesPositions = [];
  List<SortBlue> list = [];
  List<MeetingPoints> listPoints = [];
  SortBlue sb;
  int indexToBeReplaced = -1;
  int counter = 0;
  String xpoint = "", ypoint = "";
  var isLoading = false;
  List<BeaconsM> beacons;
  BeaconsDataBase dbHelper;
  String BmacId,BpositionA,BpositionB;

  @override
  void initState() {
    super.initState();
    getDeviceDetails();
  }


  getDeviceDetails() {

    SortBlue bleDevice = SortBlue(result.device.id.toString(), _CalculateRsi(result));

     if (list.length < 3) {
       list.add(bleDevice);
      } else {
       int indexToReplace = -1;
       for (int i = 0; i < list.length; i++) {
         // compare distance
         if(double.parse(bleDevice.distance) < double.parse(list[i].distance)) {
           indexToReplace = i;
           break;
         }
       }
       if(indexToReplace != -1) {
         list[indexToReplace] = bleDevice;
       }
     }
     //  macid and distance to new call
    for(int i=0;i<list.length;i++){
      String macid =list[i].bmac_id.toString();
      String distance=list[i].bdistance.toString();
      _fetchData(macid, distance);
    }
    // ** Top Three Mac Ids and Distance => Query or Service to get Position for Beacon Mac_Id ** //
  }

  _fetchData(String macid, String distance) {
    beacons = dbHelper.getBeaconByMacId(macid) as List<BeaconsM>;
    print("Check Data Base : "+beacons.toString());
    _sendBeacons(beacons, distance);
    }

  _sendBeacons(List<BeaconsM>  beacons,distance) {

    for (int j = 0; j < beacons.length; j++) {
      setState(() {
        BmacId = beacons[j].mac_id.toString();
        BpositionA = beacons[j].bpositionA.toString();
        BpositionB = beacons[j].bpositionB.toString();
      });

      Map<String, String> devices1 = new Map();
      devices1['mac_id'] = BmacId;
      devices1['distance'] = distance;
      devices1['positionA'] = BpositionA;
      devices1['positionB'] = BpositionB;

      minDevicesPositions.add(devices1);

      //minDevicesPositions.add(MeetingPoints.map(BmacId));
    }
    if(minDevicesPositions.length==3) {
      _meetingPointsList();
    }else{
      getDeviceDetails();
    }
  }

  void _meetingPointsList() {
    ///get all the data distance*3, positionA and PositionB *3
    listPoints = minDevicesPositions.map((data) => MeetingPoints.fromMap(data)).toList();
    getMeetingPointsModified(listPoints);

  }
  // ignore: non_constant_identifier_names
  _CalculateRsi(ScanResult result) {
    var txPower;
    txPower = result.advertisementData.txPowerLevel == null ? -59 : result.advertisementData.txPowerLevel;
    var ratio = result.rssi * 1.0 / txPower;
    if (ratio < 1.0) {
      return math.pow(ratio, 10).toStringAsFixed(1);
    } else {
      var distance = (0.89976) * math.pow(ratio, 7.7095) + 0.111;
      return distance.toStringAsFixed(2);
    }
  }

  void getMeetingPointsModified(List<MeetingPoints> list) {
    if(list.length == 3) {
      var distanceA, distanceB, distanceC, pointA1, pointA2, pointB1, pointB2, pointC1, pointC2;

      distanceA = list[0].distance;
      pointA1 = list[0].positionA;
      pointA2 = list[0].positionB;

      distanceB = list[1].distance;
      pointB1 = list[1].positionA;
      pointB2 = list[1].positionB;

      distanceC = list[2].distance;
      pointC1 = list[2].positionA;
      pointC2 = list[2].positionB;

      var w, z, x, y, y2;
      w = distanceA * distanceA - distanceB * distanceB - pointA1 * pointA1 - pointA2 * pointA2 + pointB1 * pointB1 + pointB2 * pointB2;
      z = distanceB * distanceB - distanceC * distanceC - pointB1 * pointB1 - pointB2 * pointB2 + pointC1 * pointC1 + pointC2 * pointC2;
      x = (w * (pointC2 - pointB2) - z * (pointB2 - pointA2)) / (2 * ((pointB1 - pointA1) * (pointC1 - pointB2) - (pointC1 - pointB1) * (pointB2 - pointA2)));
      y = (w - 2 * x * (pointB1 - pointA1)) / (2 * (pointB2 - pointA2));
      y2 = (z - 2 * x * (pointC1 - pointB1)) / (2 * (pointC1 - pointB2));
      y = (y + y2) / 2;

      setState(() {
        xpoint = x.toStringAsFixed(0);
        ypoint = y.toStringAsFixed(0);
      });

      const pushData = const Duration(seconds:30);
      new Timer.periodic(pushData, (Timer t) => _sendData(xpoint,ypoint));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return  BidirectionalScrollViewPlugin(
        child: CustomPaint(
          painter: MyPainter(),
          size: new Size(width * 2, height),
        ),
    );
  }

  _sendData(String x,String y) {
    //  position of the person
    // Service call to send the person location to server
  }
}
