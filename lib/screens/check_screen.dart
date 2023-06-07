import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../components/qrscan.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  late String currentTime;
  late String currentDay;
  late String employeeName;
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 35),
            child: Text(
              'Welcome',
              style: TextStyle(
                color: Colors.black54,
                fontSize: screenWidth / 18,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Employee',
              style: TextStyle(
                color: Colors.black87,
                fontSize: screenWidth / 15,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 35),
            child: Text(
              'Today`s Status',
              style: TextStyle(
                fontSize: screenWidth / 13,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 30),
            height: screenHeight / 5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Check In',
                        style: TextStyle(
                          fontSize: screenWidth / 18,
                          color: Colors.black54,
                        ),
                      ),
    //                   FutureBuilder(
    //                     future: FirebaseFirestore.instance.collection(),
    //                     builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
    // return Text("checkIn: ${['checkIn']}");
    // }
    //
    // return Text("loading");},),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Check Out',
                        style: TextStyle(
                          fontSize: screenWidth / 18,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '--',
                        style: TextStyle(
                          fontSize: screenWidth / 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              currentDay = DateFormat('dd MMMM yyyy').format(DateTime.now()),
              style: TextStyle(
                fontSize: screenWidth / 15,
                color: Colors.black87,
              ),
            ),
          ),
          StreamBuilder(
            stream: Stream.periodic(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  currentTime = DateFormat('hh:mm:ss a').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: screenWidth / 15,
                    color: Colors.black54,
                  ),
                ),
              );
            }
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QRViewExample(),
                  // currentTime: currentTime, currentDay: currentDay
              ));
            },
            child: Container(
              height: screenHeight/4,
              width: screenWidth/2,
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.expand,
                        size: 70,
                      ),
                      Icon(
                        FontAwesomeIcons.camera,
                        size: 25,
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Scan to Check In',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: screenWidth/20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
