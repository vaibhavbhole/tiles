import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tiles/data/remote/AppExceptions.dart';

class NetworkApiService {
  final String baseurl = "http://52.138.102.35:10895/api/";

  Future postResponse(
      String url, String? bearerToken, Map<String, dynamic> content) async {
    dynamic responseJson;
    try {
      if (bearerToken != null) {
        final response = await http.post(
          Uri.parse(baseurl + url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $bearerToken',
          },
          body: jsonEncode(content),
        );
        responseJson = returnResponse(response);

      } else {
        final response = await http.post(
          Uri.parse(baseurl + url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(content),
        );
        responseJson = returnResponse(response);

      }
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
