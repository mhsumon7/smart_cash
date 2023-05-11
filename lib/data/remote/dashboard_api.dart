import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../local/storage_healper.dart';
import '../utils/base_url.dart';

class DashboardApi extends GetConnect {
  Future<dynamic> getDashboardData() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/providers/list'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: '_token')}'
        },
      )
      .then((value) => value.body/*{print('There it is'+value.body.toString())}*/)
      .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> getDashboardDataNonToken() => http
      .get(
    Uri.parse('${BaseUrl.baseUrl}/providers'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  )
      .then((value) => value.body/*{print('There it is'+value.body.toString())}*/)
      .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> getLogout() => http
      .post(
        Uri.parse('${BaseUrl.baseUrl}/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
