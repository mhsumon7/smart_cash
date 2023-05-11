import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/base_url.dart';

class LoginApi extends GetConnect {
  static Future<dynamic> getlogin({String? email, String? password}) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/consumer/login'), body: {
        'email': email,
        'password': password,
      })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
