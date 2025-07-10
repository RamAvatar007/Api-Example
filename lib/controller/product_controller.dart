import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider_api/model/product_list_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends ChangeNotifier {
  bool isLoading = false;
  List<ProductListModel> productList = [];
  ProductListModel? selectedProduct;
  selectedProductDetails(ProductListModel product){
    selectedProduct = product;
    print("data<><><><><><><><><><>${jsonEncode(product)}");
    notifyListeners();
  }

  Future<void> getProductList() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products"),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
       productList = List<ProductListModel>.from(data.map((item) => ProductListModel.fromJson(item))).toList();
      } else {
        print("Status code: ${response.statusCode} - ${response.body} \n");
      }
    } catch (e, stackTrace) {
      print('\ngetProductList : $e');
      print("\ngetProductList : $stackTrace");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
