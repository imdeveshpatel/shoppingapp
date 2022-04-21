import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ApiProvider {
  var client = http.Client();
  var apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>?> getRequestMethod() async {
    var response = await client.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<Product> productList = productFromJson(response.body);

      return productList;
    } else {
      Future.error("Error");
    }
    return null;
  }

  String postRequestMethod(postPost) {
    //var response = await client.post(Uri.parse(apiUrl), body: postPost);
    return "";
  }
}
