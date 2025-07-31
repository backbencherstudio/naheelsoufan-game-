import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/forgot_pass/presentation/widget/forgot_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/forgot_pass/presentation/widget/forgot_bottom.dart';
import '../../../../common_widegts/auth_appbar/auth_appbar.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            RegisterAppbar(),
            SizedBox(height: 156.h),
            ForgotBody(),
            SizedBox(height: 185.5.h),
            ForgotBottom()
          ],
        ),
      ),
    );
  }
}
