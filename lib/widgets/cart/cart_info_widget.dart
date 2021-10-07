import 'package:eatit_v2/fonts/fonts.dart';
import 'package:eatit_v2/state/cart_state.dart';
import 'package:eatit_v2/utils/utils.dart';
import 'package:flutter/material.dart';

class CartInfoWidget extends StatelessWidget {
  const CartInfoWidget({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  final cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          bottom: 8),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8),
            child: Text(
              cartModel.name,
              style: fontCartDetailItem,
              maxLines: 2,
              overflow:
              TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8),
            child: Row(
              mainAxisSize:
              MainAxisSize.max,
              mainAxisAlignment:
              MainAxisAlignment
                  .start,
              children: [
                Icon(
                  Icons.monetization_on,
                  color: Colors.grey,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '${currencyFormat.format(cartModel.price)}',
                  style:
                  fontCartDetailItem,
                  maxLines: 2,
                  overflow: TextOverflow
                      .ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}