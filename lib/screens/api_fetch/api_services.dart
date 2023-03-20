import 'dart:convert';

import 'package:http/http.dart';

import 'model.dart';

class ApiServices {
  String endPoint = "https://dummyjson.com/products";
  List<ProductModel> productDatas = [];

  Future<List<ProductModel>> getUser() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["products"];
      print(result);
      productDatas = List<ProductModel>.of(
          result.map<ProductModel>((json) => ProductModel.fromJson(json)));
      // return result.map((e) => ProductModel.fromJson(e)).toList();
      return productDatas;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
//List<ExamSubjectModel>.of(
    //    data.map<ExamSubjectModel>((json) => ExamSubjectModel.fromJson(json)));