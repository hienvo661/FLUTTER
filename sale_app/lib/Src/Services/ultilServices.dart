import 'package:intl/intl.dart';

class UltilServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.currency(
      locale: 'vi',
      customPattern: ',### \u00a4',
      // decimalDigits: 3,
    );
    return numberFormat.format(price);
  }
}
