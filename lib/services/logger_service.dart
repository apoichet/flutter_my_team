import 'package:logger/logger.dart';

Logger _logger;

Logger logger() {
  return _logger??Logger(
    printer: PrettyPrinter(),
  );
}
