class Product{
  int _id;
  String _name;
  String _price;
  String _weight;

  Product(this._name, this._price,this._weight);

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id' : _id,
      'name' : _name,
      'price' : _price,
      'weight' : _weight,
    };
    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _price = map['price'];
    _weight = map['weight'];
  }

  Product.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._price = obj['price'];
    this._weight = obj['weight'];
  }
  int get id => _id;
  String get name => _name;
  String get price => _price;
  String get weight => _weight;

}