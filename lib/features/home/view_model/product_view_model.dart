import 'package:flutter/material.dart';

import 'package:patch_assignment/features/home/repository/product_repository.dart';
import 'package:patch_assignment/features/home/model/product_model.dart';
import 'package:patch_assignment/app/services/response/api_response.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel() {
    fetchData();
  }
  //Products List
  ApiResponse<List<Product>> _products = ApiResponse.loading();
  ApiResponse<List<Product>> get products => _products;

  bool highest = false;
  bool lowest = false;

  final ProductRepository _productRepo = ProductRepository();

  //Categories List
  List<String> _categories = [];
  List<String> get categories => _categories;

  //Selected Category
  int? selectedCategoryIndex;

  //First picture of products of each category
  List<String> _categoryImage = [];
  List<String> get categoryImage => _categoryImage;

  //Products filtered by category
  List<Product> filteredByCategory = [];

  //Filtered by query
  List<Product> filteredProducts = [];

  //Fetching data from repository and storing it in list
  Future<void> fetchData() async {
    _setList(ApiResponse.loading());
    try {
      final value = await _productRepo.getProducts();
      _setList(ApiResponse.completed(value));
      _extractCategories();
    } catch (error) {
      _setList(ApiResponse.failed());
    }
  }

  //Setting up list
  void _setList(ApiResponse<List<Product>> response) {
    _products = response;
    notifyListeners();
  }

  //Extract the categories from the list of products
  void _extractCategories() {
    if (_products.data != null && _products.data!.isNotEmpty) {
      _categories =
          _products.data!.map((product) => product.category).toSet().toList();
      notifyListeners();
    }
  }

  //Filtering the products based on the category
  Future<void> sortByCategories(String category) async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      filteredByCategory = _products.data!
          .where((product) => product.category == category)
          .toList();
      notifyListeners();
    }
  }

  //Sorting by price - Lowest to Highest
  Future<void> lowestFirst() async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      _products.data!.sort((a, b) => a.price.compareTo(b.price));
      filteredByCategory.sort((a, b) => a.price.compareTo(b.price));
      lowest = true;
      highest = false;
      notifyListeners();
    }
  }

  //Sorting by price - Highest to Lowest
  Future<void> highestFirst() async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      _products.data!.sort((a, b) => b.price.compareTo(a.price));
      filteredByCategory.sort((a, b) => b.price.compareTo(a.price));
      highest = true;
      lowest = false;
      notifyListeners();
    }
  }

  //Getting images from the first product from each category
  Future<void> getfirstCategoryItem() async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      for (String cat in _categories) {
        _categoryImage.add(_products.data!
            .firstWhere((product) => product.category == cat)
            .image);
      }
      notifyListeners();
    }
  }

  //Getting the index of currently selected category
  Future<void> getSelectedCategory(String selectedCategory) async {
    if (_products.data != null && _products.data!.isNotEmpty) {
      selectedCategoryIndex =
          _categories.indexWhere((category) => category == selectedCategory);
      notifyListeners();
    }
  }

  Future<void> filterProducts(String query) async {
    if (_products.data!.isNotEmpty && products.data != null) {
      if (query.isEmpty) {
        filteredProducts = _products.data!;
      } else {
        filteredProducts = _products.data!
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      notifyListeners();
    }
  }

  //Add more methods down here
}
