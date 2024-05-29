import 'package:intl/intl.dart';

extension DateHelperString on String {

  DateTime? toDateFormatted() {
    final dateFormat = DateFormat('dd.MM.yyyy');
    try {
      return dateFormat.parse(this);
    } catch(err, _) {
      return null;
    }
  }

}

extension DateHelperDateTime on DateTime {

  String toStringFormatted() => DateFormat('dd.MM.yyyy').format(this);

  String toStringFormattedGetOperationHistory() => DateFormat('dd.MM.yyyy HH:mm:ss').format(this);

  String toStringFormattedRunOperation() => DateFormat('dd.MM.yyyy HH:mm').format(this);

}