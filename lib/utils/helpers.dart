import 'package:intl/intl.dart';

class AppHelper {
  static DateTime epochToDate(int? epoch) {
    if (epoch == null) {
      return DateTime.now();
    }
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    return dateTime;
  }

  static String dateToString(DateTime dt) {
    String formattedDate = DateFormat('EEEE d, MMMM').format(dt);
    return formattedDate;
  }

  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }
}
