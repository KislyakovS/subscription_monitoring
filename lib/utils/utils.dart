import 'package:intl/intl.dart';

class Utils {
  static String formatDate({required DateTime time, String fromat = 'd MMMM'}) {
    final format = DateFormat(fromat);

    return format.format(time);
  }

  static DateTime addMonth({
    required int count,
    required DateTime currentDate,
  }) {
    return DateTime(
      currentDate.year,
      currentDate.month + count,
      currentDate.day,
    );
  }
}
