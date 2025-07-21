import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/edit_profile_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/subs_status.dart';

import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 40.h),

                // Scrollable Content
                Expanded(
                  child: Stack(
                   // clipBehavior: Clip.none,
                    children: [
                      // Main Card
                      SizedBox(
                        height:600.h,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                             margin: EdgeInsets.only(top: 40.h),
                            width: 360.w,
                            decoration: BoxDecoration(
                              color: const Color(0xff3D4279),
                              border: Border.all(color: const Color(0xffE0E0FF)),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(28.w, 60.h, 28.w, 28.h),
                              child: Column(
                                children: [
                                  Image.asset(
                                    AppImages.profile,
                                    height: 80.h,
                                    width: 80.w,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Waleed',
                                    style: style.bodyLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'wkh929@gmail.com',
                                    style: style.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  EditProfileButton(style: style),
                                  SizedBox(height: 16.h),
                                  Divider(color: Color(0xffE0E0FF)),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "Subscription Status",
                                    style: style.titleLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  SubscriptionStatus(
                                      style: style, type: 'Type', pilot: 'Pilot'),
                                  SubscriptionStatus(
                                      style: style, type: 'Games Remaining', pilot: '1'),
                                  SubscriptionStatus(
                                      style: style, type: 'Max Players', pilot: '1'),
                                  SubscriptionStatus(
                                      style: style, type: 'Questions Per Games', pilot: '10'),



                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Floating Header Button
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: HeaderButton(
                            textTitle: 'Quit Game?',
                            borderColor: Color(0xffA80710),
                            gradientColor: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFA80710),
                                Color(0xFFFF897D),
                                Color(0xFFA80710)
                              ],
                              stops: [0.0, 0.4904, 1.0],
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
