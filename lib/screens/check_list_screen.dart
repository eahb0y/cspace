import 'package:flutter/material.dart';
import '../components/checkin_checkou_list.dart';
import '../components/qrscan_hour.dart';
import '../components/reusable_button.dart';
import '../constants.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({Key? key}) : super(key: key);

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  double screenHeight = 0;
  String clientName = ' ';
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    /*          -------------------------get name form  qr screen---------------------------------        */
    Future<void> popNavigate(BuildContext context, bool status) async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRSanHour(status: status,),
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
            height: screenHeight / 2,
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
          children: [
            Expanded(
              child: ReusableButton(
                onPressed: () {
                  popNavigate(context, true);
                },
                label: 'CheckIn',
                color: Colors.green,
                textColor: Colors.white,
              ),
            ),
            Expanded(
              child: ReusableButton(
                onPressed: () {
                  popNavigate(context, false);
                },
                label: 'CheckOut',
                color: Colors.redAccent,
                textColor: Colors.white,
              ),
            ),
          ],
        )
      ],
    ));
  }
}


