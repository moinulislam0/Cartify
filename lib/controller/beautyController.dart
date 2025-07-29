import 'package:get/get.dart';
import 'package:practice_method/controller/Network.dart';
import 'package:practice_method/model/beautyModel.dart';

class Beautycontroller extends GetxController{
   bool _beautyIndecator = false;
  bool get beatyIndecator => _beautyIndecator;

  BeautyModel _beautyModel = BeautyModel();
  BeautyModel get beautyModel => _beautyModel;
   List<BeautyProducts> _filteredProducts = [];
  List<BeautyProducts> get filteredProducts => _filteredProducts;

  Future<bool> getBeauty() async {
    _beautyIndecator= true;
    update();
    final response =
        await Network.getResquest('/products/category/beauty');
    _beautyIndecator = false;
    if (response.isSuccess) {
      _beautyModel= BeautyModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
   void searchBeautyProduct(String query) {
    if (query.isEmpty) {
      _filteredProducts = _beautyModel.products ?? [];
    } else {
      _filteredProducts = (_beautyModel.products ?? []).where((product) {
        final title = product.title?.toLowerCase() ?? '';
        return title.contains(query.toLowerCase());
      }).toList();
    }
    update();
  }
}