import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return Future.value(prefs.get("USER"));
}

setUser(String user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("USER", user);
}
