import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:practice_method/controller/fragrancesController.dart';
import 'package:practice_method/widgets/fragranceswidget.dart';

class Fragrancescreen extends StatelessWidget {
  const Fragrancescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FragrancesController>(builder: (fragranceCtrl) {
      if (fragranceCtrl.fragrancesIndecator) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      final item = fragranceCtrl.fragrancesModel.products ?? [];
      return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: item.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: .65),
          itemBuilder: (context, index) {
            final product = item[index];
            return Fragranceswidget(
              item: product,
            );
          });
    });
  }
}
