import 'package:intl/intl.dart';

int getTemp(double temp) {
  // int celsius = (5 / 9 * (temp - 32)).toInt();
  int celsius = (temp - 273).toInt();
  return celsius;
}

getDateFormat(int date) {
  var millis = date;
  var dt = DateTime.fromMillisecondsSinceEpoch(millis * 1000);

// 24 Hour format:
  return DateFormat('dd.MM.yyyy HH:mm').format(dt);
}
