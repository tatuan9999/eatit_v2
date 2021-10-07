import 'package:eatit_v2/state/cart_state.dart';
import 'package:eatit_v2/state/main_state.dart';
import 'package:eatit_v2/strings/cart_strings.dart';
import 'package:eatit_v2/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_total_item_widget.dart';

class TotalWidget extends StatelessWidget {
  TotalWidget({Key? key, required this.controller}) : super(key: key);

  final CartStateController controller;
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TotalItemWidget(
              text: totalText,
              value: currencyFormat.format(controller.sumCart(
                  mainStateController.selectedRestaurant.value.restaurantId)),
              isSubTotal: false,
            ),
            Divider(
              thickness: 2,
            ),
            TotalItemWidget(
              text: shippingFeeText,
              value: currencyFormat.format(controller.getShippingFee(
                  mainStateController.selectedRestaurant.value.restaurantId)),
              isSubTotal: false,
            ),
            Divider(
              thickness: 2,
            ),
            TotalItemWidget(
              text: grandTotalText,
              value: currencyFormat.format(controller.getSubTotal(
                  mainStateController.selectedRestaurant.value.restaurantId)),
              isSubTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}
