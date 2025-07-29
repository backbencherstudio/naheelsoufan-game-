import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/edit_profile_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/subs_status.dart';
import '../../../../core/routes/route_name.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../riverpod/profile_state_notifier.dart';

class MyAccountWithCancelSubscription extends ConsumerWidget {
  const MyAccountWithCancelSubscription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final selectedIndex = ref.watch(selectedProfileProvider);

    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 40.h),

                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(top: 40.h),
                            width: 385.w,
                            decoration: BoxDecoration(
                              color: AppColorScheme.deepPuroleBG,
                              border: Border.all(
                                color: AppColorScheme.listContainerColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                28.w,
                                40.h,
                                28.w,
                                0.h,
                              ),
                              child: Column(
                                children: [
                                  selectedIndex != null
                                      ? Image.asset(
                                        AppIcons.profileImages[selectedIndex],
                                        height: 80.h,
                                        width: 80.w,
                                        fit: BoxFit.cover,
                                      )
                                      : Image.asset(
                                        AppIcons.profile01,
                                        height: 80.h,
                                        width: 80.w,
                                        fit: BoxFit.cover,
                                      ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Waleed',
                                    style: style.bodyLarge?.copyWith(
                                      color: AppColorScheme.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'wkh929@gmail.com',
                                    style: style.bodyMedium?.copyWith(
                                      color: AppColorScheme.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  GestureDetector(
                                    onTap: () {
                                      context.push(RouteName.editProfileScreen);
                                    },
                                    child: EditProfileButton(style: style),
                                  ),
                                  SizedBox(height: 16.h),
                                  Divider(color: AppColorScheme.listContainerColor),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "Subscription Status",
                                    style: style.titleLarge?.copyWith(
                                      color: AppColorScheme.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Type',
                                    pilot: 'Pilot',
                                  ),
                                  SizedBox(height: 12.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Games Remaining',
                                    pilot: '1',
                                  ),
                                  SizedBox(height: 12.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Max Players',
                                    pilot: '1',
                                  ),
                                  SizedBox(height: 12.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Questions Per Games',
                                    pilot: '10',
                                  ),

                                  SizedBox(height: 16.h),
                                  HeaderButton(
                                    textTitle: 'Cancel Subscription',
                                    borderColor: AppColorScheme.deepRed,
                                    gradientColor: LinearGradient(
                                      colors: [
                                       AppColorScheme.midRed,
                                       AppColorScheme.midRed,
                                       AppColorScheme.midRed,
                                      ],
                                    ),
                                    textStyle: style.titleSmall?.copyWith(
                                      fontSize: 18.sp,
                                      color: AppColorScheme.white
                                    ),
                                    padding: EdgeInsets.all(12.r),
                                    width: 304.w,
                                  ),
                                  SizedBox(height: 28.h,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 12,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: HeaderButton(
                            textTitle: 'My Account',
                            textStyle: style.titleLarge?.copyWith(
                              color: AppColorScheme.labelTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                            borderColor: AppColorScheme.labelTextColor,
                            gradientColor: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColorScheme.softYellow,
                                AppColorScheme.midYellow,
                                AppColorScheme.darkYellow,

                              ],
                              stops: [0.0, 0.4904, 1.0],
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 85.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
