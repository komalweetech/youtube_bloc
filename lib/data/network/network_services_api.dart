import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:youyube_bloc/data/exceptions/app_exceptions.dart';
import 'package:youyube_bloc/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi extends BaseApiServices {

  //get Api.
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time Out try again');
    }

    return jsonResponse;
  }

  //post Api
  @override
  Future<dynamic> postApi(String url, var data) async {
    print("post api url == $url");
    print("post data set to backend == $data");
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time Out try again');
    }

    return jsonResponse;
  }

  //Delete Api
  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time Out try again');
    }

    return jsonResponse;
  }

  // catch all Status code for all Api.
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        return UnauthorisedException();
      case 500:
        throw FetchDataException(
            'Error communicating with server${response.statusCode}');
      default:
        return UnauthorisedException("data not fetch api throw error");
    }
  }
}
