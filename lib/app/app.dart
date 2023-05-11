import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/bindings/root_bindings.dart';
import '../presentation/resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //Private constructor
  static final MyApp instance = MyApp._internal(); //Single Instance Singleton
  factory MyApp() => instance; //Create Factory for the class instance
  int appState = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RootBindings(),
      getPages: AppPages.routes,
      initialRoute: Routes.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
