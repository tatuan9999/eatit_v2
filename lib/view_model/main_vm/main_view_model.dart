import 'package:eatit_v2/model/restaurant_model.dart';

abstract class MainViewModel{
  Future<List<RestaurantModel>> displayRestaurantList();
}