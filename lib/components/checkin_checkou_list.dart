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
    CollectionReference users = FirebaseFirestore.instance
        .collection('Maksim Gorkiy')
        .doc('100 hour')
        .collection(widget.name);
    return FutureBuilder(
        future: users.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> docs = snapshot.data!.docs;
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
                                      e['checkIn'],
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
                        .map((e) => Padding(
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
                              e['checkOut'],
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



/*   --                   fix checkOut `cause when it firstly check the checkIn does not work                         --*/