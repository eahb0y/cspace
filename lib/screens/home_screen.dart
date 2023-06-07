import 'package:cspace/screens/check_screen.dart';
import 'package:cspace/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'check_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double screenHeight = 0;
  double screenWidth = 0;
  List<IconData> navigatorIcons = [
    FontAwesomeIcons.calendarAlt,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user
  ];

  int currentIcon = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currentIcon,
        children: [
          CheckScreen(),
          CheckListScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2,2),
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for(int icon = 0; icon< navigatorIcons.length; icon++)...<Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIcon = icon;
                      });
                    },
                    child: Center(
                      child: Icon(navigatorIcons[icon],
                      color: icon == currentIcon ? Colors.green : Colors.black87,
                        size: icon == currentIcon ? 32: 25,
                      ),
                    ),
                  ),
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}
