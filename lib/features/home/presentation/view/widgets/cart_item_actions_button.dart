import 'package:flutter/material.dart';

class CartItemActionsButton extends StatelessWidget {
  const CartItemActionsButton(
      {super.key,
      required this.backgroundColor,
      required this.iconColor,
      required this.icon,
      this.onTap});
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: backgroundColor,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
