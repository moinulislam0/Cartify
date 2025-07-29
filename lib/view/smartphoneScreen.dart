import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:practice_method/controller/smartphoneController.dart';

import 'package:practice_method/widgets/Card.dart';

class Smartphonescreen extends StatelessWidget {
  const Smartphonescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Smartphonecontroller>(
              builder: (smartCtrl) {
                if (smartCtrl.smartphoneIndecator) {
                  return const CircularProgressIndicator();
                }

                final items = smartCtrl.smartPhoneModel.products ?? [];

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
                    return CardWidgets(item: product);
                  },
                );
              },
            );
  }
}