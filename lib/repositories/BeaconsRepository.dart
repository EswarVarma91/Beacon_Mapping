
import 'package:untitled/model/BeaconsM.dart';

class BeaconsRepository{

  List<BeaconsM>  fetchAllPositions() {

    return [
     new BeaconsM("DF:0A:38:41:1F:C9","200","15",),
     new BeaconsM("E9:48:B5:E5:57:A1","280","495",),
     new BeaconsM("F1:A8:EF:DE:47:0C","10","480",),

    ];
  }

}