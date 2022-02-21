import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    title: "My Journal",
    preferences: await SharedPreferences.getInstance(),
  ));
}
