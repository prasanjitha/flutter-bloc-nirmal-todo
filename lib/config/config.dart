import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

String generateRandomId() {
  var uuid = const Uuid();
  return uuid.v4();
}

String formatDate(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
}
