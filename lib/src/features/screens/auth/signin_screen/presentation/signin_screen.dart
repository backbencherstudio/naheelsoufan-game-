import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/signin_screen/presentation/widget/signin_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/signin_screen/presentation/widget/signin_bottom.dart';

import '../../../../common_widegts/auth_appbar/auth_appbar.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            RegisterAppbar(),
            SizedBox(height: 126.h),
            SignInBody(),
            SizedBox(height: 154.h),
            SignInBottom()
          ],
        ),
      ),
    );
  }
}
