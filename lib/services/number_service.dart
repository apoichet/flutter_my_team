import 'dart:math';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

double calcPercent(double value, double valueMax) {
  var percent = value / valueMax;
  if(percent.isNaN) {
    return 0.0;
  }
  return percent;
}
