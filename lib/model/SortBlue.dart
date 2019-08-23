class SortBlue{
  String mac_id;
  String distance;

  SortBlue(this.mac_id,this.distance);


  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'mac_id' : mac_id,
      'distance' : distance,
    };
    return map;
  }

  SortBlue.fromMap(Map<String, dynamic> map) {
    mac_id = map['mac_id'];
    distance = map['distance'];
  }

  SortBlue.map(dynamic obj) {
    this.mac_id = obj['mac_id'];
    this.distance = obj['distance'];
  }

  String get bmac_id => mac_id;
  String get bdistance => distance;
}