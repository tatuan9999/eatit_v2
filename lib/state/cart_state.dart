import 'dart:convert';

import 'package:eatit_v2/const/const.dart';
import 'package:eatit_v2/model/cart_model.dart';
import 'package:eatit_v2/model/food_model.dart';
import 'package:eatit_v2/strings/cart_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartStateController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;
  final box = GetStorage();

  getCartAnonymous(String restaurantId) => cart.where((item) =>
      item.restaurantId == restaurantId && (item.userUid == KEY_ANONYMOUS));

  getCart(String restaurantId) => cart.where((item) =>
      item.restaurantId == restaurantId &&
      (FirebaseAuth.instance.currentUser == null
          ? item.userUid == KEY_ANONYMOUS
          : item.userUid == FirebaseAuth.instance.currentUser!.uid));

  addToCart(FoodModel foodModel, String restaurantId, {int quantity: 1}) async {
    try {
      var cartItem = CartModel(
          id: foodModel.id,
          name: foodModel.name,
          description: foodModel.description,
          image: foodModel.image,
          price: foodModel.price,
          addon: foodModel.addon,
          size: foodModel.size,
          quantity: quantity,
          restaurantId: restaurantId,
          userUid: FirebaseAuth.instance.currentUser == null
              ? KEY_ANONYMOUS
              : FirebaseAuth.instance.currentUser!.uid);

      if (isExists(cartItem, restaurantId)) {
        var foodNeedToUpdate =
            cart.firstWhere((element) => element.id == cartItem.id);
        foodNeedToUpdate.quantity += quantity;
      } else {
        cart.add(cartItem);
      }

      var jsonDBEncode = jsonEncode(cart);
      await box.write((MY_CART_KEY), jsonDBEncode);
      cart.refresh();
      Get.snackbar(successTitle, successMessage);
    } catch (e) {
      Get.snackbar(errorTitle, e.toString());
    }
  }

  isExists(CartModel cartItem, String restaurantId) => cart.any((e) =>
      e.id == cartItem.id &&
      e.restaurantId == restaurantId &&
      (FirebaseAuth.instance.currentUser == null
          ? e.userUid == KEY_ANONYMOUS
          : e.userUid == FirebaseAuth.instance.currentUser!.uid));

  sumCart(String restaurantId) => getCart(restaurantId).length == 0
      ? 0
      : getCart(restaurantId)
          .map((e) => e.price * e.quantity)
          .reduce((value, element) => value + element);

  getQuantity(String restaurantId) => getCart(restaurantId).length == 0
      ? 0
      : getCart(restaurantId)
          .map((e) => e.quantity)
          .reduce((value, element) => value + element);

  getShippingFee(String restaurantId) =>
      sumCart(restaurantId) * 0.1; //10% of VAT

  getSubTotal(String restaurantId) =>
      sumCart(restaurantId) + getShippingFee(restaurantId);

  clearCart(String restaurantId) {
    cart = getCart(restaurantId).clear();
    saveDatabase();
  }

  saveDatabase() => box.write(MY_CART_KEY, jsonEncode(cart));
}
