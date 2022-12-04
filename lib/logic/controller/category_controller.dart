import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/services/category_servces.dart';
import 'package:get/get.dart';

class Category_Controller extends GetxController {
  var isCategoryLoading = false.obs;
  var isCategoryProductsLoading = false.obs;

  var categoryNameList = <String>[].obs;
  var categoryProductsList = <ProductsModel>[].obs;

  List<String> categoryImagesList = [
    'assets/images/electronics.png',
    'assets/images/jewelery.png',
    'assets/images/man.png',
    'assets/images/woman.png',
  ];

  Category_Controller() {
    getCategoryNames();
  }

  void getCategoryNames() async {
    var categorynames = await Category_services.getCategories();

    try {
      isCategoryLoading(true);
      if (categorynames.isNotEmpty) {
        categoryNameList.addAll(categorynames);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

// this is the real fn to show products with category
// but the problem is than no circular progress indicator shown because this fn works fast
// so we will make this function works more slowly to show circular progress indicator!

  // void getCategoryProducts(String categoryName) async {
  //   var categoryProducts =
  //       await Category_services.getcategoriesProducts(categoryName);
  //   try {
  //     isCategoryProductsLoading(true);
  //     if (categoryProducts.isNotEmpty) {
  //       categoryProductsList.value=categoryProducts;
  //     }
  //   } finally {
  //     isCategoryProductsLoading(false);
  //   }
  // }

  getCategoryProducts(String categoryName) async {
    isCategoryProductsLoading(true);
    categoryProductsList.value =
        await Category_services.getcategoriesProducts(categoryName);
    isCategoryProductsLoading(false);
  }

  getCaetgoryByIndex(int index) async {
    var categoryByIndex = await getCategoryProducts(categoryNameList[index]);
    if (categoryByIndex != null) {
      categoryProductsList.value = categoryByIndex;
    }
  }
}
