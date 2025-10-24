import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/utils/utils.dart';
import '../../auth/riverpod/auth_providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(Duration(seconds: 1));
    if (mounted) {
      await ref.read(authNotifierProvider.notifier).fetchUserDetails();
      context.push(RouteName.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNotTab = Utils.isTablet(context);
    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 300.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.blueLogoBg,
                        height: isNotTab ? 150.h : 300.h,
                      ),
                      SvgPicture.asset(
                        AppIcons.manIcon,
                        height: isNotTab ? 96.h : 200.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
