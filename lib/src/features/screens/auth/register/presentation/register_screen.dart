import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/register/presentation/widget/register_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/register/presentation/widget/register_bottom.dart';

import '../../../../common_widegts/auth_appbar/auth_appbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __){
        context.go(RouteName.signInScreen);
      },
      child: CreateScreen(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                RegisterAppbar(),
                SizedBox(height: 20.h),
                RegisterBody(),
                SizedBox(height: 32.h),
                RegisterBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}