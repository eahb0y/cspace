import 'package:cloud_firestore/cloud_firestore.dart';

class ClientWorkTime {
  int totalMinutes = 0;
  final String clientName;
  List<String> timeList = [];


  ClientWorkTime({required this.clientName});

  Future<void> getClientTime() async {
    List<String> dataList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Maksim Gorkiy")
        .doc("100 hour")
        .collection(clientName)
        .get();
    querySnapshot.docs.forEach((element) {
      dataList.addAll([element['checkIn'], element['checkOut']]);
    });
    timeList.addAll(dataList);
  }

  String convertTo24HourFormat(String time){
    // Разделение времени на часы, минуты, секунды и AM/PM
    List<String> timeParts = time.split(' ');
    String timeString = timeParts[0];
    String meridiem = timeParts.length > 1 ? timeParts[1].toUpperCase() : '';

    // Разделение времени на часы, минуты и секунды
    List<String> timeDigits = timeString.split(':');
    int hours = int.parse(timeDigits[0]);
    int minutes = int.parse(timeDigits[1]);
    int seconds = timeDigits.length > 2 ? int.parse(timeDigits[2]) : 0;

    // Преобразование в 24-часовой формат
    if (meridiem == 'PM' && hours < 12) {
      hours += 12;
    } else if (meridiem == 'AM' && hours == 12) {
      hours = 0;
    }

    // Форматирование времени в строку без секунд
    String formattedTime = '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  void convert(){
    List<String> convertedTimes = [];
    for (var element in timeList) {
      String converting = convertTo24HourFormat(element);
      convertedTimes.add(converting);
      print(convertedTimes);
    }
    }
  }



// for (int i = 0; i < times.length - 1; i++) {
// int hours1 = int.parse(times[i].split(':')[0]);
// int minutes1 = int.parse(times[i].split(':')[1]);
//
// // Проверка наличия второго времени
// if (i + 1 < times.length) {
// int hours2 = int.parse(times[i + 1].split(':')[0]);
// int minutes2 = int.parse(times[i + 1].split(':')[1]);
//
// int timeDiffInMinutes = (hours2 * 60 + minutes2) - (hours1 * 60 + minutes1);
//
// totalMinutes += timeDiffInMinutes;
// }
// }