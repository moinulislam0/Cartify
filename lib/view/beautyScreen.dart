import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:practice_method/controller/beautyController.dart';
import 'package:practice_method/widgets/BeautyWidgets.dart';

class Beautyscreen extends StatelessWidget {
  const Beautyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Beautycontroller>(
      builder: (beautyCtrl) {
        if (beautyCtrl.beatyIndecator) {
          return const CircularProgressIndicator();
        }

        final items = beautyCtrl.beautyModel.products ?? [];

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = items[index];
            return Beautywidgets(item: product);
          },
        );
      },
    );
  }
}
