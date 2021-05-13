import 'package:intl/intl.dart';

class GlobalHelpers {
  static String formatNumbers(number) {
    final NumberFormat format = NumberFormat("#,##0");
    return format.format(number);
  }
}
