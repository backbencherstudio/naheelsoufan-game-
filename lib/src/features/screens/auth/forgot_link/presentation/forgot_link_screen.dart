import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/forgot_link/presentation/widget/forgot_link_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/forgot_link/presentation/widget/forgot_link_bottom.dart';

import '../../../../common_widegts/auth_appbar/auth_appbar.dart';

class ForgotLinkScreen extends StatelessWidget {
  const ForgotLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            RegisterAppbar(),
            SizedBox(height: 213.5.h),
            ForgotLinkBody(),
            SizedBox(height: 241.5.h),
            ForgotLinkBottom()
          ],
        ),
      ),
    );
  }
}
