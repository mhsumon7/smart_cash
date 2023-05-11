import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';
import 'data/local/storage_healper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageHelper.init(await SharedPreferences.getInstance());
  runApp(MyApp());
}