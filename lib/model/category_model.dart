import 'package:eatit_v2/model/food_model.dart';

class CategoryModel {
  String key = '', name = '', image = '';
  List<FoodModel> foods = new List<FoodModel>.empty(growable: true);

  CategoryModel(
      {//required this.key,
      required this.name,
      required this.image,
      required this.foods});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    //key = json['key'];
    name = json['name'];
    image = json['image'];
    if (json['foods'] != null) {
      foods = List<FoodModel>.empty(growable: true);
      json['foods'].forEach((v) {
        foods.add(FoodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    //data['key'] = this.key;
    data['name'] = this.name;
    data['image'] = this.image;
    data['foods'] = this.foods.map((v) => v.toJson()).toList();

    return data;
  }
}
