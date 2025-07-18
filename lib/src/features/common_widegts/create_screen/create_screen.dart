import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';

class CreateScreen extends StatelessWidget {
  final Widget child;
  const CreateScreen( {super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.backgroundImage, fit: BoxFit.cover),
          ),
          Positioned.fill(child: SafeArea(child: child)),
        ],
      ),
    );
  }
}
