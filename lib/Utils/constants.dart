import 'package:intl/intl.dart';


extension MyDateTimeExtension on DateTime {
  /// Custom made extension to format Date from ISO string to dd/MM/yy
  String formatDate({String pattern = "dd/MM/yy"}) {
    return "${DateFormat(pattern).format(this)}";
  }
}