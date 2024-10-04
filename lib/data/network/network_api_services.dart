import 'dart:convert';
import 'dart:io';

import 'package:mvvmex/data/app_exceptions.dart';
import 'package:mvvmex/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 404:
        throw UnauthorizedException(response.body);
      default:
        throw FetchDataException(
            "connection failed with " + response.statusCode.toString());
    }
  }
}
