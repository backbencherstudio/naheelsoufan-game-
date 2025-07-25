import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/edit_profile_widgets/edit_profile_icon.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/edit_profile_widgets/info_input_box.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import '../../../../core/constant/icons.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
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
                      SizedBox(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(top: 40.h),
                            width: 385.w,
                            decoration: BoxDecoration(
                              color: const Color(0xff3D4279),
                              border: Border.all(
                                color: const Color(0xffE0E0FF),
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
                                      style: style,
                                      labelName: 'Name',
                                      hintText: 'Waleed',
                                      picture: SvgPicture.asset(
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
                                      style: style,
                                      labelName: 'Email',
                                      hintText: 'waleed929@gmail.com',
                                      picture: SvgPicture.asset(
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
                                    InfoInputBox(
                                      style: style,
                                      labelName: 'Current Password',
                                      picture: SvgPicture.asset(
                                        AppIcons.visibilityOff,
                                        width: 24.0,
                                        height: 24.0,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your current password';
                                        }
                                        if (value.length < 6) {
                                          return 'Password must be at least 6 characters long';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 16.h),
                                    InfoInputBox(
                                      style: style,
                                      labelName: 'New Password',
                                      picture: SvgPicture.asset(
                                        AppIcons.visibilityOff,
                                        width: 24.0,
                                        height: 24.0,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your new password';
                                        }
                                        if (value.length < 6) {
                                          return 'Password must be at least 6 characters long';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 16.h),
                                    InfoInputBox(
                                      style: style,
                                      labelName: 'Confirm Password',
                                      picture: SvgPicture.asset(
                                        AppIcons.visibilityOff,
                                        width: 24.0,
                                        height: 24.0,
                                      ),
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
                                    ),
                                    SizedBox(height: 40.h),
                                    HeaderButton(
                                      textTitle: 'Update',
                                      padding: EdgeInsets.all(8.r),
                                      width: double.infinity,
                                      height: 58.h,
                                      borderColor: Color(0xff1D5128),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: HeaderButton(
                            textTitle: 'Edit Information',
                            textStyle: style.titleLarge?.copyWith(
                              color: Color(0xff2E1126),
                              fontWeight: FontWeight.w500,
                            ),
                            borderColor: Color(0xff2E1126),
                            gradientColor: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFF2E792),
                                Color(0xFFF8B133),
                                Color(0xFFDE712B),
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
}
