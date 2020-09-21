import 'dart:math';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return divide((value * mod).round(), mod.floor());
}

String roundDoubleToString(double value, int places) {
  if(places == 0) {
    return roundDouble(value, places).toInt().toString();
  }
  return roundDouble(value, places).toStringAsFixed(places);
}

double calcPercent(double value, double valueMax) {
  var percent = divide(value.floor(), valueMax.floor());
  if(percent.isNaN) {
    return 0.0;
  }
  return percent;
}

double divide(int numerator, int denominator) {
  if(numerator.isNaN
      || denominator.isNaN
      || numerator == 0
      || denominator == 0
  ) {
    return 0.toDouble();
  }
  return numerator / denominator;
}
