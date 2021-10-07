import 'package:eatit_v2/state/cart_state.dart';

abstract class CartViewModel {
  void updateCart(CartStateController controller, int index, int value);
  void deleteCart(CartStateController controller, int index);
  void clearCart(CartStateController controller);
}
