import 'package:eatit_v2/fonts/fonts.dart';
import 'package:flutter/material.dart';

class TotalItemWidget extends StatelessWidget {
  const TotalItemWidget({
    Key? key,
    required this.text,
    required this.value,
    required this.isSubTotal
  }) : super(key: key);

  final String text;
  final String value;
  final bool isSubTotal;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: isSubTotal ? fontCartDetailTotal: fontCartDetailItem,),
        Text(value, style: isSubTotal ? fontCartDetailTotal: fontCartDetailItem,)
      ],);
  }
}