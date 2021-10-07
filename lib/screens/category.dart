import 'package:eatit_v2/fonts/fonts.dart';
import 'package:eatit_v2/model/category_model.dart';
import 'package:eatit_v2/state/category_state.dart';
import 'package:eatit_v2/state/main_state.dart';
import 'package:eatit_v2/strings/restaurant_home_strings.dart';
import 'package:eatit_v2/view_model/category_vm/category_view_model_imp.dart';
import 'package:eatit_v2/widgets/category/category_list_widget.dart';
import 'package:eatit_v2/widgets/common/appbar_with_cart_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final viewModel = CategoryViewModelImp();
  final MainStateController mainStateController = Get.find();
  final CategoryStateController categoryStateController = Get.put(CategoryStateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithCartWidget(title: '${mainStateController.selectedRestaurant.value.name}'),
        body: FutureBuilder(
          future: viewModel.displayCategoryByRestaurantId(
              mainStateController.selectedRestaurant.value.restaurantId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              var lst = snapshot.data as List<CategoryModel>;
              return Container(
                margin: const EdgeInsets.only(top: 10),
                child: CategoryListWidget(lst: lst, categoryStateController: categoryStateController,),
              );
            }
          },
        ));
  }
}


