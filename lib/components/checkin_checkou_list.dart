import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String name;

  const GetUserName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('Maksim Gorkiy')
        .doc('100 hour')
        .collection(name);
    return FutureBuilder(
        future: users.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot?> docs = snapshot.data!.docs;
            return Row(
              children: [
                Expanded(
                  child: Column(
                    children: docs
                        .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Text(
                                  e!['checkIn'],
                                  style: const TextStyle(
                                    fontSize: 21,
                                    color: Colors.white
                                  ),
                                )),
                              ),
                        ))
                        .toList(),
                  ),
                ),


                // const VerticalDivider(
                //   color: Colors.black,
                //   thickness: 3, //thickness of divier line
                // ),



                Expanded(
                  child: Column(
                    children: docs
                        .map((ele) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                            child: Text(
                              ele?['checkOut'] ?? 'adsadda',
                              style: const TextStyle(
                                  fontSize: 21,
                                  color: Colors.white
                              ),
                            )),
                      ),
                    ))
                        .toList(),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          else {
            return const Center(
              child: Text('Loading'),
            );
          }
        });
  }
}

// FutureBuilder<DocumentSnapshot>(
// future: users.get().then((value) => {
// value.docs.forEach((element) {
// print(element.data());
// })
// }), /// get all data from doc ///
// builder:
// (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
// if (snapshot.hasError) {
// return Text("Something went wrong");
// }
//
// if (snapshot.hasData && !snapshot.data!.exists) {
// return Text("Document does not exist");
// }
//
// if (snapshot.connectionState == ConnectionState.done) {
// Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
// return Text("${data['checkIn']}");
// }
//
// return Text("loading");
// },
// );
