class Convert {
  convert(double number) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _number = double.parse(number.toStringAsFixed(1));

    return _number;
  }
}
