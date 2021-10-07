import 'package:eatit_v2/fonts/fonts.dart';
import 'package:eatit_v2/state/food_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodDetailDescriptionWidget extends StatelessWidget {
  const FoodDetailDescriptionWidget({
    Key? key,
    required this.foodListStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RatingBar.builder(
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (value) {},
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false),
            SizedBox(
              height: 10,
            ),
            Text(
              '${foodListStateController.selectedFood.value.description}',
              style: fontFoodDetailDescription,
            ),
          ],
        ),
      ),
    );
  }
}
