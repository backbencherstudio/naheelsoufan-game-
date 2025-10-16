import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/elevated_button/elevated_button.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/reset_password/presentation/widget/reset_pass_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/sign_in_screen/presentation/widget/signin_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/sign_in_screen/presentation/widget/signin_bottom.dart';
import '../../../../common_widegts/auth_appbar/auth_appbar.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateScreen(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: AppPadding.horizontalPadding,
            child: Column(
              children: [
                const RegisterAppbar(),
                SizedBox(height: 126.h),
                const ResetPassBody(),
                SizedBox(height: 154.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
