// void getClientTime(ClientWorkTime clientWorkTime) {
//   List<Map<String, dynamic>> times = [];
//
//   FirebaseFirestore.instance
//       .collection("Maksim Gorkiy")
//       .doc("100 hour")
//       .collection(clientWorkTime.clientName)
//       .get()
//       .then((querySnapshot) {
//     print("Successfully completed");
//     for (var docSnapshot in querySnapshot.docs) {
//       // print('${docSnapshot['checkIn']} => ${docSnapshot['checkOut']}');
//       times.add(docSnapshot.data());
//     }
//
//     clientWorkTime.checkTimes = times;
//   });
// },