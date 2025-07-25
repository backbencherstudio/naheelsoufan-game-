import 'package:flutter/material.dart';

class SubscriptionStatus extends StatelessWidget {
  const SubscriptionStatus({
    super.key,
    required this.style,
    required this.type,
    required this.pilot,
  });

  final TextTheme style;
  final String type;
  final String pilot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: style.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          pilot,
          style: style.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
