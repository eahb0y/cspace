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

  Future addCheckINTime(Client client) async {
    return await FirebaseFirestore.instance
        .collection('Maksim Gorkiy')
        .doc("100 hour")
        .collection(client.name)
        .doc(client.date)
        .set({"checkIn": client.checkInTime,
      "checkOut": "---"
    });
  }

  Future addCheckOutTime(Client client) async {
    return await FirebaseFirestore.instance
        .collection('Maksim Gorkiy')
        .doc("100 hour")
        .collection(client.name)
        .doc(client.date).update({"checkOut": client.checkOutTime});
  }




// Future <Client?> readUser() async{
//
//     print(docUser);
// }


}


