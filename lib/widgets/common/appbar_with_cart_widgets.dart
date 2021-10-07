import 'package:badges/badges.dart';
import 'package:eatit_v2/fonts/fonts.dart';
import 'package:eatit_v2/screens/cart_detail.dart';
import 'package:eatit_v2/state/cart_state.dart';
import 'package:eatit_v2/state/main_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWithCartWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final CartStateController cartStateController = Get.find();
  final MainStateController mainStateController = Get.find();

  AppBarWithCartWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '$title',
        style: fontAppBar,
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Obx(() => Badge(
              position: BadgePosition(top: 0, end: 1),
              animationDuration: Duration(milliseconds: 200),
              animationType: BadgeAnimationType.scale,
              showBadge: true,
              badgeColor: Colors.red,
              badgeContent: Text(
                '${cartStateController.getQuantity(mainStateController.selectedRestaurant.value.restaurantId)}',
                style: fontAppBarBadge,
              ),
              child: IconButton(
                onPressed: () => Get.to(() => CartDetailScreen()),
                icon: Icon(Icons.shopping_bag),
              ),
            )),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
