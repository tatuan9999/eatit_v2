import 'package:eatit_v2/fonts/fonts.dart';
import 'package:eatit_v2/model/size_model.dart';
import 'package:eatit_v2/state/food_detail_state.dart';
import 'package:eatit_v2/state/food_list_state.dart';
import 'package:eatit_v2/strings/food_detail_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailSizeWidget extends StatelessWidget {
  const FoodDetailSizeWidget({
    Key? key,
    required this.foodListStateController,
    required this.foodDetailStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;
  final FoodDetailStateController foodDetailStateController;

  @override
  Widget build(BuildContext context) {
    return foodListStateController.selectedFood.value.size.length > 0
        ? Card(
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
                sizeText,
                style: fontFoodDetail,
              ),
              children: foodListStateController
                  .selectedFood.value.size
                  .map((e) => RadioListTile<SizeModel>(
                  title: Text(e.name),
                  value: e,
                  groupValue: foodDetailStateController
                      .selectedSize.value,
                  onChanged: (value) => foodDetailStateController
                      .selectedSize.value = value!))
                  .toList(),
            ))
          ],
        ),
      ),
    )
        : Container();
  }
}