import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatefulWidget {
  final String name;
  const GetUserName({super.key, required this.name});

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('100 hour')
          .collection(widget.name)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          List<Map<String, dynamic>> dataList = documents
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> data = dataList[index];
              String checkIn = data['checkIn'];
              String checkOut = data['checkOut'];
              return ListTile(
                  title: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            checkIn,
                            style: const TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                            child: Text(
                          checkOut,
                          style: const TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ));
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Ошибка получения данных из Firestore');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

/*   --                   fix checkOut `cause when it firstly check the checkIn does not work                         --*/

// FutureBuilder(
// future: users.get(),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// final List<DocumentSnapshot> docs = snapshot.data!.docs;
// return Row(
// children: [
// Expanded(
// child: ListView(
// children: docs
//     .map((e) => Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// width: double.infinity,
// height: MediaQuery.of(context).size.height / 20,
// decoration: BoxDecoration(
// color: Colors.green,
// borderRadius: BorderRadius.circular(5),
// ),
// child: Center(
// child: Text(
// e['checkIn'],
// style: const TextStyle(
// fontSize: 21,
// color: Colors.white
// ),
// )),
// ),
// ))
//     .toList(),
// ),
// ),
//
// Expanded(
// child: ListView(
// children: docs
//     .map((e) => Padding(
// padding: const EdgeInsets.all(8.0),
// child:
// ))
//     .toList(),
// ),
// ),
// ],
// );
// } else if (snapshot.hasError) {
// return const Center(
// child: Text('error'),
// );
// }
// else {
// return const Center(
// child: Text('Loading'),
// );
// }
// });
//
