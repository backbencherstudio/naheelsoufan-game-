import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/elevated_button/elevated_button.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/sign_in_screen/presentation/widget/signin_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/sign_in_screen/presentation/widget/signin_bottom.dart';
import '../../../../common_widegts/auth_appbar/auth_appbar.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text('Are you sure you want to quit?'),
            actions: [
              CustomElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                buttonName: 'Cancel',
              ),
              SizedBox(height: 10.h,),
              CustomElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                buttonName: 'Exit',
              ),
            ],
          ),
        );
        if (shouldExit == true) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: CreateScreen(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: AppPadding.horizontalPadding,
              child: Column(
                children: [
                  const RegisterAppbar(),
                  SizedBox(height: 126.h),
                  const SignInBody(),
                  SizedBox(height: 154.h),
                  const SignInBottom(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}