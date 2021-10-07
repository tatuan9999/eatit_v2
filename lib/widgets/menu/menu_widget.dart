import 'package:eatit_v2/fonts/fonts.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final String menuName;
  final VoidCallback callback;
  final IconData icon;

  const MenuWidget({
    Key? key,
    required this.menuName,
    required this.callback,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(
              width: 30,
            ),
            Text(
              menuName,
              style: fontMenu,
            )
          ],
        ),
      ),
    );
  }
}
