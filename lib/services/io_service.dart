import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> _localFile(String dataFileName) async {
  final path = await _localPath;
  return File('$path/$dataFileName');
}

Future<File> writeData(String dataFileName, String data) async {
  final file = await _localFile(dataFileName);

  // Write the file.
  return file.writeAsString(data);
}

Future<String> readData(String dataFileName) async {
  final file = await _localFile(dataFileName);

  // Read the file.
  String contents = await file.readAsString();

  return contents;
}
