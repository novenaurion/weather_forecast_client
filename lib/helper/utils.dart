import 'package:intl/intl.dart';

String getDateInDay(int timeStamp){
  DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String formattedDate = DateFormat('EE').format(time);
  return formattedDate;
}