import 'package:intl/intl.dart';

extension NDDateFormatUtils on DateFormat {
  DateTime? tryParse(String inputString, [bool utc = false]) {
    try {
      return parse(inputString, utc);
    } on FormatException {
      return null;
    }
  }

  DateTime? ndTryParse(String inputString, [bool utc = false]) =>
      tryParse(inputString, utc);
}
