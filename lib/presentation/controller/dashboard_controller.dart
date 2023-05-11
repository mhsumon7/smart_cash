import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/local/storage_healper.dart';
import '../../data/model/dashboard_response.dart';
import '../../data/remote/dashboard_api.dart';
import '../resources/color_manager.dart';
import '../resources/custom_snakebar.dart';
import '../resources/routes_manager.dart';
import '../resources/showloding_dialog.dart';
import '../resources/string_manager.dart';

class DashboardController extends GetxController
    with StateMixin<List<ApiData>> {
  DashboardApi? dashboardApi;
  DashboardController({required this.dashboardApi});

  @override
  void onInit() {
    getDashboardData();
    getDashboardDataNonToken();
    super.onInit();
  }

  //Get Dashboard Data
  getDashboardData() async {
    change(null, status: RxStatus.loading());
    await dashboardApi!.getDashboardData().then((value) {

      try {
        final body = json.decode(value);
        print('CONTROLLER: '+body.toString());
        change(DashboardResponse.fromJson(body).data,
            status: RxStatus.success());
      }
      catch (exp){
        print(exp.toString());
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  getDashboardDataNonToken() async {
    change(null, status: RxStatus.loading());
    await dashboardApi!.getDashboardDataNonToken().then((value) {

      try {
        final body = json.decode(value);
        print('CONTROLLER: '+body.toString());
        change(DashboardResponse.fromJson(body).data,
            status: RxStatus.success());
      }
      catch (exp){
        print(exp.toString());
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  //Get Login Attempt
  getLogout() async {
    showLoaderDialog(Get.context, 'Please Wait...');
    try {
      dashboardApi!.getLogout().then((value) {
        Get.back();
        //Save To Db

        Get.offAllNamed(Routes.initialRoute);
        StorageHelper.eraseAll();
      }).onError((error, stackTrace) {
        Get.back();
        customSnakebar(
            title: AppStrings.formTitle,
            description: error.toString(),
            color: Colormanager.error,
            icon: Icons.info,
            snackPosition: SnackPosition.TOP);
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      Get.back();
      customSnakebar(
          title: AppStrings.formTitle,
          description: error.toString(),
          color: Colormanager.error,
          icon: Icons.info,
          snackPosition: SnackPosition.TOP);
    }
  }
}
