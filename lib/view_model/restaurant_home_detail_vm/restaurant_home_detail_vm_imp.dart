import 'package:eatit_v2/firebase/best_deal_reference.dart';
import 'package:eatit_v2/firebase/popular_reference.dart';
import 'package:eatit_v2/model/popular_item_model.dart';
import 'package:eatit_v2/view_model/restaurant_home_detail_vm/restaurant_home_detail_vm.dart';

class RestaurantHomeDetailViewModelImp implements RestaurantHomeDetailViewModel{
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealByRestaurantId(String restaurantId) {
    return getBestDealByRestaurantId(restaurantId);
  }

}