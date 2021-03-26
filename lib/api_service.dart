import 'dart:convert';
import 'dart:io';
import 'dart:js_util';

import 'package:dio/dio.dart';
import 'package:ht/models/customers.dart';
import 'config.dart';

class ApiService {
  Future<bool> createCustomer(CustomersModel model) async {
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.sceret),
    );

    bool ret = false;

    try {
      var response = await Dio().post(Config.url + Config.customerUrl,
          data: model.toJson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }));

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }

    return ret;
  }
}
