import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_drawer.dart';

class CreateScreen extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> ? keys;
  const CreateScreen( {super.key, required this.child,
  this.keys
  });

  @override
  Widget build(BuildContext context) {
      debugPrint("Scaffold Key: $keys");

    return Scaffold(
      key: keys,
      drawer: keys != null ? CustomDrawer(scaffoldKey: keys!) : null,  
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
