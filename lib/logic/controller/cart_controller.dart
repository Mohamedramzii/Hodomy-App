import 'package:ecommerce_app_with_getx/model/products_model.dart';

import 'package:get/get.dart';




class Cart_Controller extends GetxController {
  var productsMap = {}.obs;

  get productSubtotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get Total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  void addProductToCart(ProductsModel productmodel) {
    if (productsMap.containsKey(productmodel)) {
      productsMap[productmodel] += 1;
    } else {
      productsMap[productmodel] = 1;
      
    }
  }

  void removeProductInCondition(ProductsModel productsModel) {
    if (productsMap.containsKey(productsModel) &&
        productsMap[productsModel] == 1) {
      productsMap.removeWhere((key, value) => key == productsModel);
      
     
    } else {
      productsMap[productsModel] -= 1;
   
    }
  }

  void removeOneProductFromCart(ProductsModel productsModel) {
    productsMap.removeWhere((key, value) => key == productsModel);
 
  }

  void ClearCart() {
    productsMap.clear();
   
  }

  int CartCounter() {
    if(productsMap.isEmpty){
      return 0;
    }else{
      return productsMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
    }
  }
  // Map<dynamic, dynamic> productMap = {
  //   'a': [
  //     ProductsModel(
  //         id: 1,
  //         title: 'dasdasd',
  //         description: 'asdasdasd',
  //         category: null,
  //         price: 1326,
  //         image: 'sadasd',
  //         rating: Rating.fromJson({})),
  //     ProductsModel(
  //         id: 1,
  //         title: 'dasdasd',
  //         description: 'asdasdasd',
  //         category: null,
  //         price: 1326,
  //         image: 'sadasd',
  //         rating: Rating.fromJson({})),
  //   ],
  //   'b': ProductsModel(
  //       id: 1,
  //       title: 'dasdasd',
  //       description: 'asdasdasd',
  //       category: null,
  //       price: 1326,
  //       image: 'sadasd',
  //       rating: Rating.fromJson({}))
  // };
}
