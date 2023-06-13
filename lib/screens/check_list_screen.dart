import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../get_time/get_client_time.dart';
import '../qr_scan/qrscan_hour.dart';
import '../components/reusable_button.dart';
import '../constants.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({Key? key}) : super(key: key);

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  String clientName = ' ';
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    /*          -------------------------get name form  qr screen---------------------------------        */
    Future<void> popNavigate(BuildContext context) async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRSanHour(),
        ),
      );
      if (result != null) {
        setState(() {
          clientName = result;
        });
      }
    }
/*     --------------------------------------------------------------------------------        */
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Имя : $clientName',
          style: clientsStyle,
        ),
        Text(
          'Hours : ',
          style: clientsStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: screenHeight / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.black26, width: 3),
            ),
            child: Container(
              child: GetUserName(name: clientName,),
            )
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                popNavigate(context);
              },
              child: Container(
                height: screenHeight/5,
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
                        'Scan to Check',
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
      ],
    ));
  }
}


