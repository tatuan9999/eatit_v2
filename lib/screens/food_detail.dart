import 'package:eatit_v2/fonts/fonts.dart';
import 'package:eatit_v2/model/size_model.dart';
import 'package:eatit_v2/state/category_state.dart';
import 'package:eatit_v2/state/food_detail_state.dart';
import 'package:eatit_v2/state/food_list_state.dart';
import 'package:eatit_v2/strings/food_detail_strings.dart';
import 'package:eatit_v2/utils/utils.dart';
import 'package:eatit_v2/widgets/food_detail/food_detail_description_widget.dart';
import 'package:eatit_v2/widgets/food_detail/food_detail_image_widget.dart';
import 'package:eatit_v2/widgets/food_detail/food_detail_name_widget.dart';
import 'package:eatit_v2/widgets/food_detail/food_detail_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class FoodDetailScreen extends StatelessWidget {
  final CategoryStateController categoryStateController = Get.find();
  final FoodListStateController foodListStateController = Get.find();
  final FoodDetailStateController foodDetailStateController =
      Get.put(FoodDetailStateController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScroolled) {
        return [
          SliverAppBar(
            title: Text(
              '${foodListStateController.selectedFood.value.name}',
              style: fontAppBar,
            ),
            elevation: 10,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            foregroundColor: Colors.black,
            bottom: PreferredSize(
              preferredSize: Size.square(foodDetailImageAreaSize(context)),
              child: FoodDetailImageWidget(
                  foodListStateController: foodListStateController),
            ),
          )
        ];
      },
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FoodDetailNameWidget(
                  foodDetailStateController: foodDetailStateController,
                  foodListStateController: foodListStateController),
              FoodDetailDescriptionWidget(
                  foodListStateController: foodListStateController),
              FoodDetailSizeWidget(
                  foodListStateController: foodListStateController,
                  foodDetailStateController: foodDetailStateController),
              Card(
                elevation: 12,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => ExpansionTile(
                            title: Text(
                              addonText,
                              style: fontFoodDetail,
                            ),
                            children: [
                              Wrap(
                                children: foodListStateController
                                    .selectedFood.value.addon
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ChoiceChip(
                                              label: Text(e.name),
                                              selected: foodDetailStateController.selectedAddon.contains(e),
                                          selectedColor: Colors.amber,
                                          onSelected: (selected) => selected?foodDetailStateController.selectedAddon.add(e): foodDetailStateController.selectedAddon.remove(e),),
                                        ))
                                    .toList(),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )));
  }
}
