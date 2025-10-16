import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../../../common_widegts/snack_bar_message/custom_snack_bar.dart';
import '../../../widget/custom_textformfield.dart';
import '../../../riverpod/auth_providers.dart';

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

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final subTitleStyle = Theme.of(context).textTheme.displaySmall;
    final isNotTab = Utils.isTablet(context);

    ref.listen<AsyncValue>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (success) {
          if (success) {
            context.go(RouteName.gameModeScreens);
            CustomSnackBar.show(context, 'Login Successful');
          } else {
            CustomSnackBar.show(context, 'Something Went Wrong!');
          }
        },
        error: (err, _) {
          CustomSnackBar.show(context, err.toString());
        },
      );
    });

    final authState = ref.watch(authNotifierProvider);

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
                  );
                }
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
                  );
                },
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => context.go('${RouteName.signInScreen}${RouteName.forgetPasswordScreen}'),
                    child: Text("Forgot password?", style: subTitleStyle),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              CustomElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await ref.read(authNotifierProvider.notifier).login(newPasswordController.text, confirmPasswordController.text,);
                  }
                },
                buttonName: authState.isLoading ? 'Resetting...' : 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
