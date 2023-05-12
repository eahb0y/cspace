import 'package:cspace/screens/qr_scan_screen.dart';
import 'package:cspace/screens/test.dart';
import 'package:cspace/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const Test(),
      routes: <String, Widget Function(BuildContext)>{
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        QRScanScreen.id: (context) => const QRScanScreen(),
      },
    );
  }
}
