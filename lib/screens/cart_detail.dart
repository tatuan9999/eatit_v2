import 'package:eatit_v2/state/cart_state.dart';
import 'package:eatit_v2/state/main_state.dart';
import 'package:eatit_v2/strings/cart_strings.dart';
import 'package:eatit_v2/view_model/cart_vm/cart_view_model_imp.dart';
import 'package:eatit_v2/widgets/cart/cart_image_widget.dart';
import 'package:eatit_v2/widgets/cart/cart_info_widget.dart';
import 'package:eatit_v2/widgets/cart/cart_total_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartDetailScreen extends StatelessWidget {
  final box = GetStorage();
  final CartStateController controller = Get.find();
  final MainStateController mainStateController = Get.find();

  final CartViewModelImp cartViewModelImp = new CartViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          controller.getQuantity(mainStateController
                      .selectedRestaurant.value.restaurantId) >
                  0
              ? IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: clearCartConfirmTitleText,
                        textCancel: cancelText,
                        textConfirm: confirmText,
                        confirmTextColor: Colors.yellow,
                        middleText: clearCartConfirmContentText,
                        onConfirm: () {
                          cartViewModelImp.clearCart(controller);
                          Get.back();
                        });
                  },
                  icon: Icon(Icons.clear))
              : Container()
        ],
      ),
      body: controller.getQuantity(
                  mainStateController.selectedRestaurant.value.restaurantId) >
              0
          ? Obx(() => Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: controller
                              .getCart(mainStateController
                                  .selectedRestaurant.value.restaurantId)
                              .length,
                          itemBuilder: (context, index) => Slidable(
                                child: Card(
                                  elevation: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: CartImageWidget(
                                                cartModel: controller.getCart(
                                                    mainStateController
                                                        .selectedRestaurant
                                                        .value
                                                        .restaurantId)[index],
                                                controller: controller)),
                                        Expanded(
                                            flex: 6,
                                            child: CartInfoWidget(
                                                cartModel: controller.getCart(
                                                    mainStateController
                                                        .selectedRestaurant
                                                        .value
                                                        .restaurantId)[index])),
                                        Center(
                                          child: ElegantNumberButton(
                                            initialValue: controller
                                                .getCart(mainStateController
                                                    .selectedRestaurant
                                                    .value
                                                    .restaurantId)[index]
                                                .quantity,
                                            minValue: 1,
                                            maxValue: 100,
                                            onChanged: (value) {
                                              cartViewModelImp.updateCart(
                                                  controller,
                                                  mainStateController
                                                      .selectedRestaurant
                                                      .value
                                                      .restaurantId,
                                                  index,
                                                  value.toInt());
                                            },
                                            decimalPlaces: 1,
                                            color: Colors.amber,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: deleteText,
                                    icon: Icons.delete,
                                    color: Colors.red,
                                    onTap: () {
                                      Get.defaultDialog(
                                          title: deleteCartConfirmTitleText,
                                          textCancel: cancelText,
                                          textConfirm: confirmText,
                                          confirmTextColor: Colors.yellow,
                                          middleText:
                                              deleteCartConfirmContentText,
                                          onConfirm: () {
                                            cartViewModelImp.deleteCart(
                                                controller,
                                                mainStateController
                                                    .selectedRestaurant
                                                    .value
                                                    .restaurantId,
                                                index);
                                            Get.back();
                                          });
                                    },
                                  )
                                ],
                              ))),
                  TotalWidget(
                    controller: controller,
                  )
                ],
              ))
          : Center(
              child: Text(cartEmptyText),
            ),
    );
  }
}
