import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:practice_method/model/ResponseModel.dart';
import 'package:practice_method/urls/Utility.dart';

class Network {
  Network._();
  static Future<Responsemodel> getResquest(String url) async {
    HttpClient createHttpClient() {
  final client = HttpClient()
    ..badCertificateCallback = ( X509Certificate cert, String host, int port) => true;
  return client;
}

final ioClient = IOClient(createHttpClient());
final response = await ioClient.get(Uri.parse(Utility.baseUrl + url));
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
