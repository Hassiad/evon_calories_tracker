import 'package:evon_calories_tracker/utils/regex_utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String formatNumber({num? value, String? symbol, int decimalDigits: 2}) =>
    NumberFormat.currency(
      locale: 'en',
      symbol: symbol ?? '',
      decimalDigits: decimalDigits,
    ).format(value);

String formatDate(
    {required String pattern, DateTime? dateObject, String? dateString}) {
  initializeDateFormatting();
  DateTime date = dateObject ?? DateTime.parse(dateString!);
  return DateFormat(pattern, 'en').format(date);
}

String toTitleCase(String el) {
  if (el == null || el.isEmpty) return '';
  String firstChar = el[0].toUpperCase();
  return el.length == 1
      ? firstChar
      : '$firstChar${el.substring(1).toLowerCase()}';
}

String formatNameToTitleCase(String name) {
  return name.toLowerCase().splitMapJoin(nameSeparatorRegex,
      onMatch: (Match match) {
    return match.input.substring(match.start, match.end);
  }, onNonMatch: (String str) {
    return toTitleCase(str);
  });
}

String splitInFours(String value) {
  List<String> subStrings = [];
  var length = value.length;
  for (int i = 0; i < length; i += 4) {
    var diff = length - i;
    subStrings.add(value.substring(i, i + (diff >= 4 ? 4 : diff)));
  }

  return subStrings.join(' ');
}
