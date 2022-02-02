import 'package:intl/intl.dart';

class FormatterUtils {
  FormatterUtils._();

  static String formatCurrency(double value) {
    final _formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: r'R$'
    );

    return _formatter.format(value);
  }
}