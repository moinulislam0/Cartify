import 'dart:convert';

import 'package:http/http.dart';
import 'package:practice_method/model/ResponseModel.dart';
import 'package:practice_method/urls/Utility.dart';

class Network {
  Network._();
  static Future<Responsemodel> getResquest(String url) async {
    final Response response = await get(Uri.parse(Utility.baseUrl + url));
    try {
      if (response.statusCode == 200) {
        return Responsemodel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return Responsemodel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      return Responsemodel(
          isSuccess: false,
          statusCode: response.statusCode,
          returnData: e.toString());
    }
  }
}
