import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/repository/user/user_service.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/utils/utils.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../auth/riverpod/auth_providers.dart';
import '../../quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import '../riverpod/profile_state_notifier.dart';

class ProfileIconScreen extends ConsumerWidget {
  const ProfileIconScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIconIndex);
    final style = Theme.of(context).textTheme;
    final isNotTab = Utils.isTablet(context);
    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 10.h),

                Expanded(
                  child: Stack(
                    children: [
                      Align(
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
                              28.h,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: isNotTab ? null : 20.h),
                                selectedIndex != null
                                    ? Image.asset(
                                      AppIcons.profileImages[selectedIndex],
                                      height: 80.h,
                                      width: 80.w,
                                    )
                                    : Image.asset(
                                      AppIcons.profile01,
                                      height: 80.h,
                                      width: 80.w,
                                    ),
                                SizedBox(height: 12.h),
                                Divider(color: AppColorScheme.primaryTextColor),
                                SizedBox(height: 40.h),

                                Expanded(
                                  child: GridView.builder(
                                    itemCount: AppIcons.profileImages.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          crossAxisSpacing: 8.w,
                                          mainAxisSpacing: 8.h,
                                          childAspectRatio: 1,
                                        ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          ref.read(selectedIconIndex.notifier).state = index;
                                        },
                                        child: Center(
                                          child: Container(
                                            padding: EdgeInsets.all(3.r),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    selectedIndex == index
                                                        ? AppColorScheme.white
                                                        : Colors.transparent,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                            child: Image.asset(
                                              AppIcons.profileImages[index],
                                              width: 60.w,
                                              height: 60.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(height: 40.h),
                                InkWell(
                                  onTap: () async {
                                    if(selectedIndex == -1) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Please select an icon!')),
                                      );
                                    }
                                    else {
                                      final response = await UserProfileRepository.updateProfilePic(imgPath: AppIcons.profileImages[selectedIndex]);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(response ?? "Failed to update profile picture")),
                                      );
                                    }
                                    ref.read(authNotifierProvider.notifier).fetchUserDetails();
                                  },
                                  child: HeaderButton(
                                    textTitle: 'Update',
                                    padding: EdgeInsets.all(8.r),
                                    width: double.infinity,
                                    height: isNotTab ? 58.h : 100.h,
                                    borderColor: AppColorScheme.hardGradGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 13,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: HeaderButton(
                            textTitle: 'Change Icon',
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
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
