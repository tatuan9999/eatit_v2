import 'package:eatit_v2/model/category_model.dart';
import 'package:get/get.dart';

class CategoryStateController extends GetxController {
  var selectedCategory =
      CategoryModel(name: 'name', image: 'image', foods: []).obs;
}
