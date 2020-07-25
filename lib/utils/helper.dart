import 'package:intl/intl.dart';

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';

T cast<T>(x) => x is T ? x : null;

var dateString = 'April 20, 2020';
DateFormat format = new DateFormat("MMMM dd, yyyy");
var formattedDate = format.parse(dateString);

DateTime formatToDate(String data) {
  return DateTime.now();
}
