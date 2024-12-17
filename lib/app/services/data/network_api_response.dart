import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;

import 'base_api_service.dart';
import 'package:patch_assignment/app/services/app_exceptions.dart';

class NetworkApiResponse extends BaseApiService{
  @override
  //Fetches response which is then used in repository to fetch data from API Endpoint
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

  //Returns response
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
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