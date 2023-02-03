import 'package:intl/intl.dart';

String separateByComma(int number) {
  var formatter = NumberFormat('#,###');
  return formatter.format(number);
}
