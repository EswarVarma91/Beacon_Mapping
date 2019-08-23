class MeetingPoints {

  int id;
  String mac_id;
  String distance;
  String positionA;
  String positionB;

  MeetingPoints(this.mac_id,this.distance, this.positionA, this.positionB);

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id' : id,
      'mac_id' : mac_id,
      'distance' : distance,
      'positionA' : positionA,
      'positionB' : positionB,
    };
    return map;
  }

  MeetingPoints.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    mac_id = map['mac_id'];
    distance = map['distance'];
    positionA = map['positionA'];
    positionB = map['positionB'];
  }

  MeetingPoints.map(dynamic obj) {
    this.id = obj['id'];
    this.mac_id = obj['mac_id'];
    this.distance = obj['distance'];
    this.positionA = obj['positionA'];
    this.positionB = obj['positionB'];
  }


  int get bid => id;
  String get Mmac_id => mac_id;
  String get Mdistance => distance;
  String get MpositionA => positionA;
  String get MpositionB => positionB;

}