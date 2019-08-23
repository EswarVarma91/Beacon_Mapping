

import 'package:untitled/model/Items.dart';

class Categories{

  List<Items>  fetchAllItems() {

    return [
      new Items("assets/images/fluttericon.png", "Fruits", 2.99, 250, 0),
      new Items("assets/images/fluttericon.png", "Vegetables", 2.35, 500, 1),
      new Items("assets/images/fluttericon.png", "Oils", 2.35, 500, 2),
      new Items("assets/images/fluttericon.png", "Bakery", 1.99, 250, 3),
      new Items("assets/images/fluttericon.png", "Dairy Products", 2.35, 500, 4),
      new Items("assets/images/fluttericon.png", "Beverages", 1.99, 250, 5),
    ];
  }

}