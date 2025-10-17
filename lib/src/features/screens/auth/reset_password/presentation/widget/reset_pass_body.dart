import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../../../common_widegts/snack_bar_message/custom_snack_bar.dart';
import '../../../riverpod/auth_providers.dart';
import '../../../riverpod/reset_pass_riverpod.dart';
import '../../../riverpod/reset_pass_state.dart';
import '../../../widget/custom_textformfield.dart';

class ResetPassBody extends ConsumerStatefulWidget {

  const ResetPassBody({super.key});

  @override
  _ResetPassBodyState createState() => _ResetPassBodyState();
}

class _ResetPassBodyState extends ConsumerState<ResetPassBody> {
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }
    if (val.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please confirm your password';
    }
    if (val != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final subTitleStyle = Theme.of(context).textTheme.displaySmall;
    final isNotTab = Utils.isTablet(context);

    ref.listen<ResetPassState>(resetPasswordProvider, (previous, next) {
      if (!next.isLoading) {
        if (next.isSuccess) {
          CustomSnackBar.show(context, next.message ?? 'Password reset successful');
          context.go(RouteName.signInScreen); // Navigate on success
        } else if (next.message != null && next.message!.isNotEmpty) {
          CustomSnackBar.show(context, next.message!);
        }
      }
    });

    final resetState = ref.watch(resetPasswordProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorScheme.deepPuroleBG,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 2.sp, color: AppColorScheme.primaryTextColor),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 28.w,
          right: 28.w,
          bottom: 28.h,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Reset Password", style: titleStyle)),
              SizedBox(height: 16.h),
              Text("New Password", style: subTitleStyle),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, __) {
                  final isVisible = ref.watch(isObscure4);
                  return CustomTextFormField(
                    hintText: "Enter new password",
                    controller: newPasswordController,
                    textInputAction: TextInputAction.next,
                    suffixIcon: SizedBox(
                      width: 24.sp,
                      height: isNotTab ? 24.sp : 20.sp,
                      child: (!isVisible
                          ? SvgPicture.asset(AppIcons.visibilityOff)
                          : SvgPicture.asset(AppIcons.visibilityOn)),
                    ),
                    onSuffixTap: () {
                      ref.read(isObscure4.notifier).state = !isVisible;
                    },
                    obscureText: !isVisible,
                    validator: _validatePassword,
                  );
                },
              ),
              SizedBox(height: 8.h),
              Text("Confirm Password", style: subTitleStyle),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, __) {
                  final isVisible = ref.watch(isObscure5);
                  return CustomTextFormField(
                    hintText: "Confirm your password",
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    suffixIcon: SizedBox(
                      width: 24.sp,
                      height: isNotTab ? 24.sp : 20.sp,
                      child: (!isVisible
                          ? SvgPicture.asset(AppIcons.visibilityOff)
                          : SvgPicture.asset(AppIcons.visibilityOn)),
                    ),
                    onSuffixTap: () {
                      ref.read(isObscure5.notifier).state = !isVisible;
                    },
                    obscureText: !isVisible,
                    validator: _validateConfirmPassword,
                  );
                },
              ),
              SizedBox(height: 40.h),
              CustomElevatedButton(
                onPressed: () {
                  if (newPasswordController.text == confirmPasswordController.text) {
                    _handleResetPassword();
                  }
                },
                buttonName: resetState.isLoading ? 'Resetting...' : 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _handleResetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      final success = await ref.read(resetPasswordProvider.notifier).resetPassword(
        newPass: newPasswordController.text,
      );
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to reset password')),
        );
      }
    }
  }
}
