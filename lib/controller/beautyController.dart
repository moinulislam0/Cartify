import 'package:get/get.dart';
import 'package:practice_method/controller/Network.dart';
import 'package:practice_method/model/beautyModel.dart';

class Beautycontroller extends GetxController{
   bool _beautyIndecator = false;
  bool get beatyIndecator => _beautyIndecator;

  BeautyModel _beautyModel = BeautyModel();
  BeautyModel get beautyModel => _beautyModel;

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
}