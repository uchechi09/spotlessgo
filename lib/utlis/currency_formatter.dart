import 'package:intl/intl.dart';

final NumberFormat nairaFormatter = NumberFormat.currency(
  locale: 'en',
  symbol: '₦',
  decimalDigits: 0,
);
