import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/pay_to_play.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/subscription_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';

class ChoosePaymentCard extends StatelessWidget {
  const ChoosePaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: CreateScreen(
        key: keys,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconsButtons(
                    icon: AppIcons.backSvg,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                  CustomPopUpMenu(),
                ],
              ),
              SizedBox(height: 40.h),
              Center(child: PayToPlay()),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(height: 40.h),
                    Column(
                      children: [
                        PaymentCardWidget(
                          title: 'Games',
                          subtitle: ": 6 games",
                          title2: 'Max Players',
                          subtitle2: ': Up to 8 Players',
                          description:
                              'Get your game on with 3 quick rounds of fun with your friends!',
                          borderColor: AppColorScheme.secondary,
                          rocketBackground: AppColorScheme.borderColor,
                          buttonText: '\$5 per 3 game',
                          quality: 'Basic',
                          color: AppColorScheme.borderColor,
                        ),

                        SizedBox(height: 12.h),

                        PaymentCardWidget(
                          title: 'Games',
                          subtitle: ": 6 games",
                          title2: 'Max Players',
                          subtitle2: ': Up to 8 Players',
                          description:
                              'Get your game on with 3 quick rounds of fun with your friends!',
                          borderColor: AppColorScheme.hardGradGreen,
                          rocketBackground: AppColorScheme.softGradGreen,
                          buttonText: '\$10 per 3 game',
                          quality: 'Standard',
                          color: AppColorScheme.softGradGreen,
                        ),
                        SizedBox(height: 12.h),

                        PaymentCardWidget(
                          title: 'Games',
                          subtitle: ": 6 games",
                          title2: 'Max Players',
                          subtitle2: ': Up to 8 Players',
                          description:
                              'Get your game on with 3 quick rounds of fun with your friends!',
                          borderColor: AppColorScheme.labelTextColor,
                          rocketBackground: AppColorScheme.optionBg,
                          buttonText: '\$15 per 3 game',
                          quality: 'Premium',
                          color: AppColorScheme.optionBg,
                        ),
                      ],
                    ),
                    SizedBox(height: 19.h),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(RouteName.paymentScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 66.w,
                    vertical: 16.h,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 64.w),
                  decoration: BoxDecoration(
                    color: AppColorScheme.customGreenBT,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border(
                      bottom: BorderSide(
                        color: AppColorScheme.greenborder,
                        width: 2.w,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'NEXT',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
