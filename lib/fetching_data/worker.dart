import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Worker {
  String name;
  DateTime time;
  Worker({required this.name, required this.time});

  void sentDateToServer({
    required String collectionName,
    required String name,
    required DateTime time,
  }) async {
    FirebaseFirestore.instance.collection(collectionName).doc(name).set({
      'name': name,
      'checkIn': time,
    });
  }
}
