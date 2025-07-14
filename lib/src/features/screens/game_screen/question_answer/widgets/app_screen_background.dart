import 'package:flutter/material.dart';

import '../../../../../core/constant/images.dart';

class AppScreenBackground extends StatelessWidget {
  const AppScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            AppImages.appBackground,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
