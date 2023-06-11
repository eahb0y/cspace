import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cspace/servise/employee.dart';

class Status{
  late String checkIn;
  late String checkOut;


  void getUser(Employee employee) async{
      try{
        DocumentSnapshot snap2 = await FirebaseFirestore
            .instance
            .collection('Maksim Gorkiy')
            .doc('Night')
            .collection(employee.name)
            .doc(employee.date)
            .get();
          checkIn = snap2['checkIn'];
          checkOut = snap2['checkOut'];
      }catch(e){
          checkIn = "error";
          checkOut = "error";
      }
    }
}