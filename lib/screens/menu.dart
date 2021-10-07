import 'package:eatit_v2/const/const.dart';
import 'package:eatit_v2/strings/restaurant_home_strings.dart';
import 'package:eatit_v2/view_model/menu_vm/menu_view_model_imp.dart';
import 'package:eatit_v2/widgets/menu/menu_widget.dart';
import 'package:eatit_v2/widgets/menu/home_menu_widget.dart';
import 'package:eatit_v2/widgets/menu/menu_widget_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  final viewModel = MenuViewModelImp();

  MenuScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_MENU_BG),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: Color(COLOR_ICON_DRAWER),
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
            Divider(
              thickness: 1,
            ),
            HomeMenuWidget(zoomDrawerController: zoomDrawerController),
            Divider(
              thickness: 1,
            ),
            MenuWidget(
              icon: Icons.restaurant_rounded,
              menuName: restaurantListText,
              callback: viewModel.backToRestaurantList,
            ),
            Divider(
              thickness: 1,
            ),
            MenuWidget(
              icon: Icons.list,
              menuName: categoriesText,
              callback: viewModel.navigateCategories,
            ),
            Spacer(),
            Divider(
              thickness: 1,
            ),
            MenuWidgetCallback(
              icon: viewModel.checkLoginState(context)? Icons.logout:Icons.login,
              menuName: viewModel.checkLoginState(context)? logoutText: loginText,
              callback: viewModel.checkLoginState(context)? viewModel.logout
                  :viewModel.login,
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
