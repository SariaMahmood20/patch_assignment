import 'package:patch_assignment/app/services/data/network_api_response.dart';
import 'package:patch_assignment/app/services/data/base_api_service.dart';
import 'package:patch_assignment/features/home/model/product_model.dart';
import 'package:patch_assignment/app/constants/api_endpoints.dart';

class ProductRepository{
  
  final BaseApiService _baseApiService = NetworkApiResponse();

  Future<List<Product>> getProducts()async{
    try{
      dynamic response = await _baseApiService.getGetApiResponse(ApiEndpoints.baseUrl);
      List<Product> products = (response as List<dynamic>).map((item)=> Product.fromJson(item)).toList();
      return products;
    }catch(e){
      print(e.toString());
      rethrow;
    }
  }

}