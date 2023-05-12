import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cspace/fetching_data/worker.dart';
import 'package:intl/intl.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final controller = TextEditingController();
  Worker worker = Worker(name: ' ', time: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          IconButton(
            onPressed: () {
              final name = controller.text;
              worker.sentDateToServer(
                collectionName: 'worker',
                name: controller.text,
                time: DateTime.timestamp(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
