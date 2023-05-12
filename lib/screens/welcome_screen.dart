import 'package:cspace/components/reusable_button.dart';
import 'package:cspace/screens/qr_scan_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = '/welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Welcome',
              style: welcomeStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: 100,
                  color: Colors.purple.shade800,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "SPACE",
                      style: spaceStyle,
                    ),
                    Text(
                      'coworking',
                      style: cowStyle,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ReusableButton(
                  onPressed: () {},
                  label: 'Log in',
                  color: Colors.black87,
                  textColor: Colors.black45,
                ),
                const SizedBox(
                  height: 25,
                ),
                ReusableButton(
                  onPressed: () {},
                  label: 'Register',
                  color: Colors.black87,
                  textColor: Colors.black45,
                ),
                const SizedBox(
                  height: 25,
                ),
                ReusableButton(
                  onPressed: () {
                    Navigator.pushNamed(context, QRScanScreen.id);
                  },
                  label: 'QR-code',
                  color: Colors.black87,
                  textColor: Colors.black45,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
