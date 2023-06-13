import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  final String name;
  final String date;
  final String checkInTime;
  final String checkOutTime;

  Client({
    required this.name,
    required this.date,
    required this.checkInTime,
    required this.checkOutTime,
  });

  Future addChekInChekOutTime(Client client) async {
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection('Maksim Gorkiy')
        .doc('100 hour')
        .collection(client.name)
        .doc(client.date)
        .get();
    try {
      String snap = snap2['checkIn'];
      await FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('100 hour')
          .collection(client.name)
          .doc(client.date)
          .update({
        'checkIn': snap,
        'checkOut': client.checkOutTime,
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('100 hour')
          .collection(client.name)
          .doc(client.date)
          .set({
        'checkIn': client.checkInTime,
        'checkOut': "--/--",
      });
    }
  }
}
