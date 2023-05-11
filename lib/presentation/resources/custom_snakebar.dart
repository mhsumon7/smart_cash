import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_manager.dart';

void customSnakebar(
    {required String? title,
    required String? description,
    required Color? color,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    required IconData? icon}) {
  Get.snackbar(
    title.toString(),
    description.toString(),
    icon: Icon(icon, color: Colormanager.white),
    snackPosition: snackPosition,
    backgroundColor: color,
    borderRadius: 20,
    margin: const EdgeInsets.all(14),
    colorText: Colormanager.white,
    duration: const Duration(seconds: 2),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
