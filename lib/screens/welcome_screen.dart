import 'package:cspace/components/reusable_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
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
            const Text('Welcome', style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 50,
              color: Colors.black87
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.purple.shade800,
                ),
                const Column(
                  children: [
                    Text("SPACE"),
                    Text('coworking'),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
