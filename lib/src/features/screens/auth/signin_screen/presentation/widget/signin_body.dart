import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/riverpod/user_controller.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/repository/auth/auth_repository_implementation.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../../../common_widegts/snack_bar_message/custom_snack_bar.dart';
import '../../../register/presentation/widget/custom_textformfield.dart';
import '../../riverpod/check.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<SignInBody> {
  late final TextEditingController emailController;
  late final TextEditingController passController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final subTitleStyle = Theme.of(context).textTheme.displaySmall;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Sign In", style: titleStyle)],
              ),
              SizedBox(height: 16.h),
              Text("Email", style: subTitleStyle),
              SizedBox(height: 4.h),
              CustomTextFormField(
                hintText: "Enter your email",
                controller: emailController,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 8.h),
              Text("Password", style: subTitleStyle),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, _) {
                  final isVisible = ref.watch(isObscure3);
                  return CustomTextFormField(
                    hintText: "Enter password",
                    controller: passController,
                    textInputAction: TextInputAction.done,
                    suffixIcon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child:
                          (!isVisible
                              ? SvgPicture.asset(AppIcons.visibilityOff)
                              : SvgPicture.asset(AppIcons.visibilityOn)),
                    ),
                    onSuffixTap: () {
                      ref.read(isObscure3.notifier).state = !isVisible;
                    },
                    obscureText: !isVisible,
                  );
                },
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //use gestureDetector (onTap:)
                  InkWell(
                    onTap: () => context.go(RouteName.forgetPasswordScreen),
                    child: Text("Forgot password?", style: subTitleStyle),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Consumer(
                builder: (context, ref, _) {
                  return CustomElevatedButton(
                    onPressed: () async {
                      final loginSuccess = await AuthRepositoryImplementation().loginService(emailController.text, passController.text);
                      if ((_formKey.currentState?.validate() ?? false) && loginSuccess) {
                        ref.read(userProvider.notifier).insertData();
                        debugPrint("\n\n\n${ref.watch(userProvider)}\n\n\n");
                        context.go(RouteName.gameModeScreens);
                      } else {
                        CustomSnackBar.show(context, "Invalid Credentials or please check your connection");
                      }
                    },
                    buttonName: 'Sign In',
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
