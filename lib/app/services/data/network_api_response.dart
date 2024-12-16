import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;

import 'base_api_service.dart';
import 'package:patch_assignment/app/services/app_exceptions.dart';

class NetworkApiResponse extends BaseApiService{
  @override
  Future<dynamic> getGetApiResponse(String urlPath) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(urlPath));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("Check Internet Connectivity");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        return FetchBadRequestException();
      case 404:
        return FetchUnauthorisedAccessException();
      default:
        return FetchDataException("Error while communicating with the server");
    }
  }
  
  
}