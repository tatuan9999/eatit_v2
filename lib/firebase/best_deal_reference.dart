import 'dart:convert';

import 'package:eatit_v2/const/const.dart';
import 'package:eatit_v2/model/popular_item_model.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<PopularItemModel>> getBestDealByRestaurantId(String restaurantId) async{
  var list = List<PopularItemModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference().child(RESTAURANT_REF)
      .child(restaurantId).child(BEST_DEAL_REF).once();
  Map<dynamic,dynamic> values = source.value;
  values.forEach((key, value) {
    list.add(PopularItemModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}