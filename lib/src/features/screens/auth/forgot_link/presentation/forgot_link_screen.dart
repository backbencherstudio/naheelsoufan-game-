import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/forgot_link/presentation/widget/forgot_link_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/forgot_pass/presentation/widget/forgot_bottom.dart';
import '../../../../common_widegts/auth_appbar/auth_appbar.dart';

class ForgotLinkScreen extends StatelessWidget {
  const ForgotLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        context.go(RouteName.signInScreen);
      },
      child: CreateScreen(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Column(
            children: [
              RegisterAppbar(),
              SizedBox(height: 213.5.h),
              ForgotLinkBody(),
              SizedBox(height: 241.5.h),
              ForgotBottom()
            ],
          ),
        ),
      ),
    );
  }
}
