import 'package:eatit_v2/screens/menu.dart';
import 'package:eatit_v2/screens/restaurant_home_detail.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class RestaurantHome extends StatelessWidget {
  final zoomDrawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ZoomDrawer(

        controller: zoomDrawerController,
        menuScreen: MenuScreen(zoomDrawerController),
        mainScreen: RestaurantHomeDetail(zoomDrawerController),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        backgroundColor: Colors.grey[300]!,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        openCurve: Curves.bounceInOut,
        closeCurve: Curves.ease,
      ),
    ));
  }
}
