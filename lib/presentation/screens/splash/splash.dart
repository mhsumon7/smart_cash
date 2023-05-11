import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smart_cash/data/remote/login_api.dart';
import 'package:smart_cash/presentation/resources/color_manager.dart';
import 'package:smart_cash/presentation/resources/style_manager.dart';

import '../../../data/local/storage_healper.dart';
import '../../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    if (StorageHelper.getString(key: '_token') != null) {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
   // SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colormanager.primary,
      body: Center(
        child: Center(
          child: Text('Smart Cash', style: getBoldStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
    );
  }
}
