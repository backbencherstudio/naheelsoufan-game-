import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/edit_profile_widgets/edit_profile_icon.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/edit_profile_widgets/info_input_box.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/riverpod/obsecute_state_notifier.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/riverpod/user/user_controller.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../auth/riverpod/auth_providers.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../riverpod/change_password_riverpod.dart';
import '../riverpod/edit_profile_riverpod.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userData = ref.read(userProvider);
      if (userData != null) {
        nameController.text = userData.name ?? '';
        emailController.text = userData.email ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final style = Theme.of(context).textTheme;
    final isNotTab = Utils.isTablet(context);

    final editNotifier = ref.read(editProfileProvider.notifier);

    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
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

                  Stack(
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
                                width: 2.w,
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
                                  EditProfileIcon(),
                                  SizedBox(height: 16.h),
                                  InfoInputBox(
                                    controller: nameController,
                                    style: style,
                                    labelName: 'Name',
                                    hintText: 'Walid',
                                    onSuffixTap: () async {

                                      final newName = nameController.text.trim();
                                      if (newName.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Name cannot be empty')),
                                        );
                                        return;
                                      }

                                      final success = await editNotifier.updateProfile(
                                        name: newName,
                                      );

                                      if (success) {
                                        await ref.read(authNotifierProvider.notifier).fetchUserDetails();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(ref.read(editProfileProvider).message ?? 'Name updated', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Failed to update name', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                                        );
                                      }

                                    },
                                    suffixIcon: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                      ),
                                      height: 24.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF1D5128),
                                            Color(0xFF14BA37),
                                            Color(0xFF1D5128),
                                          ],
                                          stops: [0.0, 0.4904, 1.0],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Change",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.copyWith(
                                            fontSize: isPortrait ? 12.sp : 6.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
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
                                    readOnly: true,
                                    labelName: 'Email',
                                    hintText: 'waleed929@gmail.com',
                                    // suffixIcon: SvgPicture.asset(
                                    //   AppIcons.selectedFilledBle,
                                    //   width: 24.0,
                                    //   height: 24.0,
                                    // ),
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
                                          width: isNotTab ? 24.sp : 12.sp,
                                          height: isNotTab ? 24.sp : 12.sp,
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
                                          ref.read(isVisible1.notifier).state =
                                              !isVisible;
                                        },
                                        obscureText: !isVisible,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
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
                                    builder: (_, ref, _) {
                                      final isVisible = ref.watch(isVisible2);
                                      return InfoInputBox(
                                        style: style,
                                        labelName: 'New Password',
                                        suffixIcon: SizedBox(
                                          width: isNotTab ? 24.sp : 12.sp,
                                          height: isNotTab ? 24.sp : 12.sp,
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
                                          ref.read(isVisible2.notifier).state =
                                              !isVisible;
                                        },
                                        obscureText: !isVisible,
                                        controller: newPasswordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your new password';
                                          }
                                          if (value.length < 8) {
                                            return 'Password must be at least 8 characters long';
                                          }
                                          return null;
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(height: 16.h),
                                  Consumer(
                                    builder: (_, ref, _) {
                                      final isVisible = ref.watch(isVisible3);
                                      return InfoInputBox(
                                        style: style,
                                        labelName: 'Confirm Password',
                                        suffixIcon: SizedBox(
                                          width: isNotTab ? 24.sp : 12.sp,
                                          height: isNotTab ? 24.sp : 12.sp,
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
                                          ref.read(isVisible3.notifier).state =
                                              !isVisible;
                                        },
                                        obscureText: !isVisible,
                                        controller: confirmPasswordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please confirm your password';
                                          }
                                          String? newPassword = newPasswordController.text.trim();
                                          if (value != newPassword) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(height: 40.h),
                                  InkWell(
                                    onTap: () async {
                                      final email = emailController.text.trim();
                                      final oldPassword = currentPasswordController.text.trim();
                                      final newPassword = newPasswordController.text.trim();

                                      if (oldPassword.isEmpty || newPassword.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Please fill in all fields!')),
                                        );
                                        return;
                                      }

                                      if (oldPassword == newPassword) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Old and New Password are same!')),
                                        );
                                        return;
                                      }

                                      final notifier = ref.read(changePasswordProvider.notifier);
                                      await notifier.changePassword(
                                        email: email,
                                        oldPassword: oldPassword,
                                        newPassword: newPassword,
                                      );

                                      final state = ref.read(changePasswordProvider);

                                      if (state.isSuccess) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(state.message ?? 'Password changed successfully', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(state.message ?? 'Failed to change password', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                                        );
                                      }
                                      context.pop();
                                    },
                                    child: HeaderButton(
                                      textTitle: 'Update',
                                      padding: EdgeInsets.all(8.r),
                                      width: double.infinity,
                                      height: isNotTab ? 58.h : 100.h,
                                      borderColor:
                                          AppColorScheme.startGradGreen,
                                    ),
                                  ),
                                ],
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
                ],
              ),
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
