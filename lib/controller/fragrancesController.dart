import 'package:get/get.dart';
import 'package:practice_method/controller/Network.dart';
import 'package:practice_method/model/FragranceModel.dart';

class FragrancesController extends GetxController {
  bool _fragrancesIndecator = false;
  bool get fragrancesIndecator => _fragrancesIndecator;
  FragrancesModel _fragrancesModel = FragrancesModel();
  FragrancesModel get fragrancesModel => _fragrancesModel;

  Future<bool> getFragrances() async {
    _fragrancesIndecator = true;
    update();
    final response = await Network.getResquest('/products/category/fragrances');
    _fragrancesIndecator = false;
    if (response.isSuccess) {
      _fragrancesModel = FragrancesModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
