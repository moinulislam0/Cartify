import 'package:get/get.dart';
import 'package:practice_method/controller/Network.dart';
import 'package:practice_method/model/SmartPhoneModel.dart';

class Smartphonecontroller extends GetxController {
  bool _samrtPhoneIndecator = false;
  bool get smartphoneIndecator => _samrtPhoneIndecator;

  SmartPhoneModel _smartPhoneModel = SmartPhoneModel();
  SmartPhoneModel get smartPhoneModel => _smartPhoneModel;

  Future<bool> getSmartphone() async {
    _samrtPhoneIndecator = true;
    update();
    final response =
        await Network.getResquest('/products/category/smartphones');
    _samrtPhoneIndecator = false;
    if (response.isSuccess) {
      _smartPhoneModel = SmartPhoneModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
