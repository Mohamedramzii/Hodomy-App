import 'package:ecommerce_app_with_getx/model/category_model.dart';
import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:http/http.dart' as http;

class Category_services {
  static Future<List<String>> getCategories() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load categories names from server');
    }
  }

  static Future<List<ProductsModel>> getcategoriesProducts(String categoryName)async{
    var response= await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if(response.statusCode==200){
      var jsonData = response.body;
      return productsModelFromJson(jsonData);
    }else{
      return throw Exception('Failed to load categories products from server');
    }
  }
}
