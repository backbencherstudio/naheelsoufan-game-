import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/edit_profile_widgets/edit_profile_icon.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/edit_profile_widgets/info_input_box.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/riverpod/obsecute_state_notifier.dart';
import '../../../../core/constant/icons.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
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
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  28.w,
                                  40.h,
                                  28.w,
                                  28.h,
                                ),
                                child: Column(
                                  children: [
                                    EditProfileIcon(),
                                    SizedBox(height: 16.h),
                                    InfoInputBox(
                                      controller: nameController,
                                      style: style,
                                      labelName: 'Name',
                                      hintText: 'Waleed',
                                      suffixIcon: SvgPicture.asset(
                                        AppIcons.selectedFilledBle,
                                        width: 24.0,
                                        height: 24.0,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 16.h),
                                    InfoInputBox(
                                      controller: emailController,
                                      style: style,
                                      labelName: 'Email',
                                      hintText: 'waleed929@gmail.com',
                                      suffixIcon: SvgPicture.asset(
                                        AppIcons.selectedFilledBle,
                                        width: 24.0,
                                        height: 24.0,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        String pattern =
                                            r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b';
                                        RegExp regExp = RegExp(pattern);
                                        if (!regExp.hasMatch(value)) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 24.h),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Change Password',
                                        style: style.bodyLarge?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Consumer(
                                      builder: (_, ref, _) {
                                        final isVisible = ref.watch(isVisible1);
                                        return InfoInputBox(
                                          controller: currentPasswordController,
                                          style: style,
                                          labelName: 'Current Password',
                                          suffixIcon: SizedBox(
                                            width: 24.sp,
                                            height: 24.sp,
                                            child:
                                                (!isVisible
                                                    ? SvgPicture.asset(
                                                      AppIcons.visibilityOff,
                                                    )
                                                    : SvgPicture.asset(
                                                      AppIcons.visibilityOn,
                                                    )),
                                          ),
                                          onSuffixTap: () {
                                            ref
                                                .read(isVisible1.notifier)
                                                .state = !isVisible;
                                          },
                                          obscureText: !isVisible,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your current password';
                                            }
                                            if (value.length < 6) {
                                              return 'Password must be at least 6 characters long';
                                            }
                                            return null;
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 16.h),
                                    Consumer(
                                      builder: (_,ref,_) {
                                        final isVisible = ref.watch(isVisible2);
                                        return InfoInputBox(
                                          style: style,
                                          labelName: 'New Password',
                                          suffixIcon: SizedBox(
                                            width: 24.sp,
                                            height: 24.sp,
                                            child:
                                            (!isVisible
                                                ? SvgPicture.asset(
                                              AppIcons.visibilityOff,
                                            )
                                                : SvgPicture.asset(
                                              AppIcons.visibilityOn,
                                            )),
                                          ),
                                          onSuffixTap: () {
                                            ref
                                                .read(isVisible2.notifier)
                                                .state = !isVisible;
                                          },
                                          obscureText: !isVisible,
                                          controller: newPasswordController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your new password';
                                            }
                                            if (value.length < 6) {
                                              return 'Password must be at least 6 characters long';
                                            }
                                            return null;
                                          },
                                        );
                                      }
                                    ),
                                    SizedBox(height: 16.h),
                                    Consumer(
                                      builder: (_,ref, _) {
                                        final isVisible = ref.watch(isVisible3);
                                        return InfoInputBox(
                                          style: style,
                                          labelName: 'Confirm Password',
                                          suffixIcon: SizedBox(
                                            width: 24.sp,
                                            height: 24.sp,
                                            child:
                                            (!isVisible
                                                ? SvgPicture.asset(
                                              AppIcons.visibilityOff,
                                            )
                                                : SvgPicture.asset(
                                              AppIcons.visibilityOn,
                                            )),
                                          ),
                                          onSuffixTap: () {
                                            ref
                                                .read(isVisible3.notifier)
                                                .state = !isVisible;
                                          },
                                          obscureText: !isVisible,
                                          controller: confirmPasswordController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please confirm your password';
                                            }
                                            String? newPassword = 'New Password';
                                            if (value != newPassword) {
                                              return 'Passwords do not match';
                                            }
                                            return null;
                                          },
                                        );
                                      }
                                    ),
                                    SizedBox(height: 40.h),
                                    HeaderButton(
                                      textTitle: 'Update',
                                      padding: EdgeInsets.all(8.r),
                                      width: double.infinity,
                                      height: 58.h,
                                      borderColor:
                                          AppColorScheme.startGradGreen,
                                    ),
                                  ],
                                ),
                              ),
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
                            textTitle: 'Edit Information',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
