import 'dart:convert';

import 'package:eatit_v2/const/const.dart';
import 'package:eatit_v2/model/category_model.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<CategoryModel>> getCategoryByRestaurantId(String restaurantId) async{
  var list = List<CategoryModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference().child(RESTAURANT_REF)
      .child(restaurantId).child(CATEGORY_REF).once();
  Map<dynamic,dynamic> values = source.value;
  values.forEach((key, value) {
    list.add(CategoryModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}