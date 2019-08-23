import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:untitled/model/BeaconsM.dart';

class BeaconsDataBase {
  static Database _db;
  static const String ID = 'id';
  static const String MAC_ID = 'mac_id';
  static const String POSITIONA = 'positionA';
  static const String POSITIONB = 'positionB';
  static const String TABLE = 'BeaconsTb';
  static const String DATABASE = 'BeaconDb';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb1();
    return _db;
  }

  initDb1() async {
    io.Directory directoryD = await getApplicationDocumentsDirectory();
    String path = join(directoryD.path, DATABASE);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY, $MAC_ID TEXT, $POSITIONA TEXT, $POSITIONB TEXT)');
  }

  Future<int> save(BeaconsM beacons) async {
    var dbClient = await db;
    var res = await dbClient.insert(TABLE, beacons.toMap());
    /*var res = await dbClient.rawInsert("INSERT into $TABLE ($ID,$NAME,$PRICE)"
        " VALUES (${product.id},${product.name},${product.price})");*/
    print(res);
    return res;
  }

  Future<List<BeaconsM>> getBeaconByMacId(String macid) async {
    var dbClient = await db;
//    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME, PRICE]);
//    List<Map> maps=await dbClient.rawQuery("SELECT * FROM $TABLE");

    List<Map> maps=await dbClient.rawQuery("SELECT mac_id,positionA,positionB FROM $TABLE WHERE mac_id=$macid");
    List<BeaconsM> beacons = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        beacons.add(BeaconsM.fromMap(maps[i]));
        print(beacons);
        Fluttertoast.showToast(msg: beacons.toString());
      }
    }
    return beacons;
  }
Future<List<BeaconsM>> getAllBeacons() async {
    var dbClient = await db;
//    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME, PRICE]);
    List<Map> maps=await dbClient.rawQuery("SELECT * FROM $TABLE");

//    List<Map> maps=await dbClient.rawQuery("SELECT mac_id,positionA,positionB FROM $TABLE WHERE mac_id=$macid");
    List<BeaconsM> beacons = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        beacons.add(BeaconsM.fromMap(maps[i]));
        //print(products);
      }
    }
    return beacons;
  }

  Future<int> update(BeaconsM beacons) async{
    var dbClient=await db;
    return await dbClient.update(TABLE, beacons.toMap(), where: '$ID = ?',whereArgs: [beacons.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    var result=await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
    //print(result);
    return result;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}