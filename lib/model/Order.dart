import 'package:untitled/model/Items.dart';

class Order {

  Items _product;
  int _quantity;
  int _id;

  Order(this._product, this._quantity, this._id);

  int get id => _id;

  int get quantity => _quantity;

  Items get product => _product;

  double get orderPrice => _quantity*_product.price;

}