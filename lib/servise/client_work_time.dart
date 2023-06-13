import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ClientWorkTime{
  int totalMinutes = 0;
  final String clientName;
  List<String> checkTimes = ['asd'];
  ClientWorkTime({
    required this.clientName
});

  void getClientTime(ClientWorkTime clientWorkTime) {
    List<String> times = [];

    FirebaseFirestore.instance
        .collection("Maksim Gorkiy")
        .doc("100 hour")
        .collection(clientWorkTime.clientName)
        .get()
        .then((querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = docSnapshot.data();
        String jsonData = jsonEncode(data);
        times.add(jsonData);
      }

      clientWorkTime.checkTimes = times;
    });
  }

  void printData(){
    print(checkTimes);
  }
}

// for (int i = 0; i < times.length - 1; i++) {
// int hours1 = int.parse(times[i].split(':')[0]);
// int minutes1 = int.parse(times[i].split(':')[1]);
//
// // Проверка наличия второго времени
// if (i + 1 < times.length) {
// int hours2 = int.parse(times[i + 1].split(':')[0]);
// int minutes2 = int.parse(times[i + 1].split(':')[1]);
//
// int timeDiffInMinutes = (hours2 * 60 + minutes2) - (hours1 * 60 + minutes1);
//
// totalMinutes += timeDiffInMinutes;
// }
// }