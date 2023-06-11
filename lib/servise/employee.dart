import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  final String name;
  final String date;
  final String checkInTime;
  final String checkOutTime;

  Employee({
    required this.name,
    required this.date,
    required this.checkInTime,
    required this.checkOutTime,
  });

  Future addChekInChekOutTime(Employee employee) async{
    DocumentSnapshot snap2 = await FirebaseFirestore
        .instance
        .collection('Maksim Gorkiy')
        .doc('Night')
        .collection(employee.name)
        .doc(employee.date)
        .get();
    try {
      String snap = snap2['checkIn'];
      await FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('Night')
          .collection(employee.name)
          .doc(employee.date)
          .update({
        'checkIn': snap,
        'checkOut': employee.checkOutTime
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('Night')
          .collection(employee.name)
          .doc(employee.date)
          .set({'checkIn': employee.checkInTime});
    }
  }
}
