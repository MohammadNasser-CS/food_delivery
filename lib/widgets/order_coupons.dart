import 'package:flutter/material.dart';

class OrderCouponsWidget extends StatelessWidget {
  const OrderCouponsWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
