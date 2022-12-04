import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:http/http.dart' as http;

class Products_Services {
  static Future<List<ProductsModel>> getProductsFromServer() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if(response.statusCode ==200){
      var jsonData=response.body;
      return productsModelFromJson(jsonData);
    }else{
      return throw Exception('Failed to load products from server');
    }
  }
}
