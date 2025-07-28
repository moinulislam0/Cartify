import 'package:get/get.dart';
import 'package:practice_method/controller/Network.dart';
import 'package:practice_method/model/categoriesModel.dart';

class Categoriescontroller extends GetxController {
  bool _categoriesIndecator = false;
  bool get categoriescontroller => _categoriesIndecator;
  CategoriesModel _categoriesModel = CategoriesModel();
  CategoriesModel get categoriesModel => _categoriesModel;
  Future<bool> getCategories() async {
    _categoriesIndecator = true;
    update();
    final response = await Network.getResquest('/products/categories');
    _categoriesIndecator = false;

    if (response.isSuccess) {
      _categoriesModel = CategoriesModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
