import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:untitled/model/Product.dart';

class DatabaseHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String PRICE = 'price';
  static const String WEIGHT = 'weight';
  static const String TABLE = 'ProductsTable';
  static const String DATABASE = 'ProductsDatabase';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory directoryD = await getApplicationDocumentsDirectory();
    String path = join(directoryD.path, DATABASE);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY, $NAME TEXT, $PRICE TEXT, $WEIGHT TEXT)');
  }

   Future<int> save(Product product) async {
    var dbClient = await db;
    var res = await dbClient.insert(TABLE, product.toMap());
    /*var res = await dbClient.rawInsert("INSERT into $TABLE ($ID,$NAME,$PRICE)"
        " VALUES (${product.id},${product.name},${product.price})");*/
    print(res);
    return res;
  }

  Future<List<Product>> getAllProducts() async {
    var dbClient = await db;
//    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME, PRICE]);
    List<Map> maps=await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Product> products = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        products.add(Product.fromMap(maps[i]));
        //print(products);
      }
    }
    return products;
  }

  Future<int> update(Product product) async{
    var dbClient=await db;
    return await dbClient.update(TABLE, product.toMap(), where: '$ID = ?',whereArgs: [product.id]);
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