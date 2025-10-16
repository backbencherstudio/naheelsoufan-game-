import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/verify_otp/presentation/widgets/otp_screen_body.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/verify_otp/presentation/widgets/otp_screen_bottom.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../common_widegts/auth_appbar/auth_appbar.dart';
import '../../../../common_widegts/create_screen/create_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              RegisterAppbar(),
              SizedBox(height: 156.h),
              OtpScreenBody(),
              SizedBox(height: 185.5.h),
              OtpScreenBottom()
            ],
          ),
        ),
      ),
    );
  }
}
