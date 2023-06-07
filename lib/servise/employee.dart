import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Employee {

  final CollectionReference employee =
      FirebaseFirestore.instance.collection('Iskandar');
  Future addCheckINOrCheckOutTime({
    required String name,
    required String date,
    required String checkInTime,
}) async {
    return FirebaseFirestore.instance.collection(name).doc(date).set({
      "checkIn": checkInTime
    });
  }
}
