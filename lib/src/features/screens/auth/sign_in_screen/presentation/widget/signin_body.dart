import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../../../common_widegts/snack_bar_message/custom_snack_bar.dart';
import '../../../widget/custom_textformfield.dart';
import '../../../riverpod/auth_providers.dart';

class SignInBody extends ConsumerStatefulWidget {
  const SignInBody({super.key});

  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends ConsumerState<SignInBody> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final subTitleStyle = Theme.of(context).textTheme.displaySmall;

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
              Center(child: Text("Sign In", style: titleStyle)),
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
                builder: (_, ref, __) {
                  final isVisible = ref.watch(isObscure3);

                  return CustomTextFormField(
                    hintText: "Enter password",
                    controller: passController,
                    textInputAction: TextInputAction.done,
                    suffixIcon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child: (!isVisible
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
                    await ref.read(authNotifierProvider.notifier).login(emailController.text, passController.text,);
                  }
                },
                buttonName: authState.isLoading ? 'Signing In...' : 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
