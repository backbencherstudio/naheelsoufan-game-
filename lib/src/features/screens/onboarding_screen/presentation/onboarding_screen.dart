import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/services/token_services.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/theme/theme_extension/color_scheme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  void initState() {

    super.initState();
    _moveToHomeScreen();
  }

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(Duration(seconds: 1));
    final TokenService _tokenService = TokenService();
    final token = await _tokenService.getToken();
    if (token != null) {
      context.push(RouteName.gameModeScreens);
    } else {
      context.push(RouteName.signInScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final isNotTab = MediaQuery.of(context).size.shortestSide < 600;
    return Scaffold(
      body: CreateScreen(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 298.h),
              Image.asset(AppImages.logo, height: isNotTab ? null : 100.h,),
              SizedBox(height: 20.h),
              Text(
                'Trivia Game',
                style: style.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColorScheme.optionBg,
                ),
              ),
              SizedBox(height: 100.h),
              Text(
                'Developed by',
                style: style.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColorScheme.newText,
                ),
              ),
              Image.asset(AppImages.developedBy, height: isNotTab ? null : 100.h,),
            ],
          ),
        ),
      ),
    );
  }
}
