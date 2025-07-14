import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/custom_game_logo_container.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/custom_playgames_button.dart';

class FreeGameCard extends StatelessWidget {
  const FreeGameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xff2E1126)),
        gradient: LinearGradient(
          colors: [Color(0xffF2E792), Color(0xffF8B133), Color(0xffDE712B)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(children: [
            CustomGameLogoContainer()]),
            SizedBox(height: 20.h,),
            CustomPlaygamesButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
