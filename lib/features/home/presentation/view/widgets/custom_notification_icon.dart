import 'package:flutter/material.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green.shade50,
      ),
      child: const Icon(
        Icons.notifications_none_rounded,
        color: Colors.green,
      ),
    );
  }
}
