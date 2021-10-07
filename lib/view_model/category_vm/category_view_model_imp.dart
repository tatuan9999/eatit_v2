import 'package:eatit_v2/firebase/category_reference.dart';
import 'package:eatit_v2/model/category_model.dart';

import 'category_view_model.dart';

class CategoryViewModelImp implements CategoryViewModel {
  @override
  Future<List<CategoryModel>> displayCategoryByRestaurantId(
      String restaurantId) {
    return getCategoryByRestaurantId(restaurantId);
  }
}
