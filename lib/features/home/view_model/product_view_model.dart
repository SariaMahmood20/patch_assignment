import 'package:flutter/material.dart';

import 'package:patch_assignment/features/home/repository/product_repository.dart';
import 'package:patch_assignment/features/home/model/product_model.dart';
import 'package:patch_assignment/app/services/response/api_response.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel() {
    fetchData();
  }

  ApiResponse<List<Product>> _products = ApiResponse.loading();
  ApiResponse<List<Product>> get products => _products;

  bool highest = false;
  bool lowest = false;

  final ProductRepository _productRepo = ProductRepository();

  List<String> _categories = [];
  List<String> get categories => _categories;

  List<String> _categoryImage = [];
  List<String> get categoryImage => _categoryImage;

  List<Product> filteredByCategory = [];

  Future<void> fetchData() async {
    _setList(ApiResponse.loading());
    try {
      final value = await _productRepo.getProducts();
      _setList(ApiResponse.completed(value));
      _extractCategories(); // Process categories immediately after fetching data
    } catch (error) {
      _setList(ApiResponse.failed());
      _setError(error.toString());
    }
  }

  void _setList(ApiResponse<List<Product>> response) {
    _products = response;
    notifyListeners();
  }

  void _extractCategories() {
    if (_products.data != null && _products.data!.isNotEmpty) {
      _categories = _products.data!
          .map((product) => product.category)
          .toSet()
          .toList(); // Extract and deduplicate categories
      notifyListeners();
    }
  }

  Future<void> sortByCategories(String category) async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      filteredByCategory = _products.data!
          .where((product) => product.category == category)
          .toList();
      notifyListeners();
    }
  }

  Future<void> lowestFirst() async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      _products.data!.sort((a, b) => a.price.compareTo(b.price));
      filteredByCategory.sort((a,b)=>a.price.compareTo(b.price));
      lowest = true;
      highest = false;
      notifyListeners();
    }
  }

  Future<void> highestFirst() async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      _products.data!.sort((a, b) => b.price.compareTo(a.price));
      filteredByCategory.sort((a, b)=> b.price.compareTo(a.price));
      highest = true;
      lowest  = false;
      notifyListeners();
    }
  }

  Future<void> getfirstCategoryItem()async{
    if(_products.data != null && _products.data!.isNotEmpty){
      for(String cat in _categories){
        _categoryImage.add(_products.data!.firstWhere((product) => product.category == cat).image);
        print(_categoryImage);
        print("ISTG");
      }
      notifyListeners();
    }
  }

  void _setError(String message) {
    print("Error: $message");
    notifyListeners();
  }
}
