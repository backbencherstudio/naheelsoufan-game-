import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';


class QuitGameButtonHeader extends StatelessWidget {
  const QuitGameButtonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Align(
      alignment: Alignment.center,
      child: HeaderButton(
        textTitle: 'Quit Game?',
        borderColor: Color(0xffA80710),
        gradientColor: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFA80710), Color(0xFFFF897D), Color(0xFFA80710)],
          stops: [0.0, 0.4904, 1.0],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      ),
    );
  }
}
