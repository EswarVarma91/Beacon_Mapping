class BeaconsM {

  int id;
  String mac_id;
  String positionA;
  String positionB;

  BeaconsM(this.mac_id, this.positionA, this.positionB);

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id' : id,
      'mac_id' : mac_id,
      'positionA' : positionA,
      'positionB' : positionB,
    };
    return map;
  }

  BeaconsM.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    mac_id = map['mac_id'];
    positionA = map['positionA'];
    positionB = map['positionB'];
  }

  BeaconsM.map(dynamic obj) {
    this.id = obj['id'];
    this.mac_id = obj['mac_id'];
    this.positionA = obj['positionA'];
    this.positionB = obj['positionB'];
  }


  int get bid => id;
  String get bmac_id => mac_id;
  String get bpositionA => positionA;
  String get bpositionB => positionB;

}