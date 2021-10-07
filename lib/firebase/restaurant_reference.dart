import 'dart:convert';

import 'package:eatit_v2/const/const.dart';
import 'package:eatit_v2/model/restaurant_model.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<RestaurantModel>> getRestaurantList() async{
  var list = List<RestaurantModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).once();
  Map<dynamic,dynamic> values = source.value;
  RestaurantModel? restaurantModel;
  values.forEach((key, value) {
    restaurantModel = RestaurantModel.fromJson(jsonDecode(jsonEncode(value)));
    restaurantModel!.restaurantId = key;
    list.add(restaurantModel!);
  });

  return list;
}