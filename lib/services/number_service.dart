import 'dart:math';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

String roundDoubleToString(double value, int places) {
  if(places == 0) {
    return roundDouble(value, places).toInt().toString();
  }
  return roundDouble(value, places).toStringAsFixed(places);
}

double calcPercent(double value, double valueMax) {
  var percent = value / valueMax;
  if(percent.isNaN) {
    return 0.0;
  }
  return percent;
}
