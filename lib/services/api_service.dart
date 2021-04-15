import 'package:ht/models/login_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static var client = http.Client();
  static String apiURL = "http://bi-app.info";

  static Future<bool> loginCustomer(String username, String password) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded'
    };

    var response = await client.post("$apiURL/wp-json/jwt-auth/v1/token",
        headers: requestHeaders,
        body: {
          "username": username,
          "password": password,
        });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      LoginResponseModel responseModel = loginResponseFromJson(jsonString);

      return responseModel.statusCode == 200 ? true : false;
    }
    return false;
  }
}
