import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:untitled/cart/ScanResultBeacon.dart';

class BluetoothCheck extends StatefulWidget {
  @override
  bluetoothState createState() => bluetoothState();
}

// ignore: camel_case_types
class bluetoothState extends State<BluetoothCheck> {
  @override
  void initState() {
    super.initState();
    refreshList();
  }

  @override
  void dispose() {
    super.dispose();
    stopList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          final state = snapshot.data;
          if (state == BluetoothState.on) {
            return BluetoothOn();
          }
          return BluetoothOffScreen(state: state);
        });
  }

  void refreshList() {
    FlutterBlue.instance.startScan();
  }

  void stopList() {
    FlutterBlue.instance.stopScan();
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 80.0,
              color: Colors.white,
            ),
            Text(
              'Bluetooth Adapter is ${state.toString().substring(15)}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class BluetoothOn extends StatefulWidget {
  @override
  BluetoothOnState createState() => BluetoothOnState();
}

class BluetoothOnState extends State<BluetoothOn> {
  static List<String> deviceIds = [
    "DF:0A:38:41:1F:C9", //11193446 =>
    "E9:48:B5:E5:57:A1", //11193402 =>
    "F1:A8:EF:DE:47:0C", //11193416 =>
    //"EB:2D:E4:15:69:3F",  //11193417 =>
    //"FD:84:61:BB:1E:F1",  //11193420 =>
    //"E3:96:F1:21:97:D3",  //11193448 =>
    //"DE:13:09:0A:F1:E1",  //11193458 =>
    //"D9:1F:F4:85:E4:54", //bt05
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Layout'),
      ),
      body:  SingleChildScrollView(
          child:

              StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: BluetoothOnState.filterDevices(snapshot)
                  //     snapshot
                       .data.map((r) => ScanResultBeacon(result :r))
                      .toList(),
                ),
              ),
      ),
    );
  }

  static AsyncSnapshot<List<ScanResult>> filterDevices(
      AsyncSnapshot<List<ScanResult>> snapshot) {
    snapshot.data.removeWhere((r) => !deviceIds.contains(r.device.id.toString()));
    return snapshot;
  }
}
