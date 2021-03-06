import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.get("USER");
}

setUser(String user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("USER", user);
}
