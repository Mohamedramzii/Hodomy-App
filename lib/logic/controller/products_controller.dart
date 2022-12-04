import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/services/products_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Products_Controller extends GetxController {
  var isLoading = true.obs;
  //Local Storage
  var storage = GetStorage();
  String _key = 'addedToFav';

  //EditTextcontrollers
  TextEditingController searchTextController = TextEditingController();

//Our lists
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;
  RxList<ProductsModel> FavoritesList = <ProductsModel>[].obs;
  RxList<ProductsModel> SearchList = <ProductsModel>[].obs;

  Products_Controller() {
    List? storedFav = storage.read<List>(_key);
    if (storedFav != null) {
      FavoritesList =
          storedFav.map((e) => ProductsModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await Products_Services.getProductsFromServer();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

//Logic for favorite screen
  void AddFavorite(int productId) async {
    var existingIndex =
        FavoritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      FavoritesList.removeAt(existingIndex);
      await storage.remove(_key);
    } else {
      var unique_product =
          productsList.firstWhere((element) => element.id == productId);
      FavoritesList.add(unique_product);
      await storage.write(_key, FavoritesList);
    }
  }

  bool isFavorite(int productId) {
    return FavoritesList.any((element) => element.id == productId);
  }

  void SearchLogic(String searchName) {
    searchName = searchName.toLowerCase();
    SearchList.value = productsList.where((search) {
      //works fine but what about entering capital letters ?
      // return search.title!.contains(searchName) || search.price!.toString().contains(searchName);
      return search.title!.toLowerCase().contains(searchName) ||
          search.price!.toString().contains(searchName);
    }).toList();

    update();
  } 

  void clearsearch() {
    searchTextController.clear();
    SearchLogic('');
  }
}
