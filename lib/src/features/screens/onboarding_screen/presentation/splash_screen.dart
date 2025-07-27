import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/theme/theme_extension/color_scheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(Duration(seconds: 1));
    if (mounted) {
      context.push(RouteName.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: CreateScreen(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.blueLogoBg,
                    height: 150.h,
                    width: 150.w,
                  ),
                  SvgPicture.asset(AppIcons.manIcon, height: 96.h, width: 70.w),
                ],
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
