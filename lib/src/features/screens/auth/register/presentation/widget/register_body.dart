import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/repository/auth/auth_repository_implementation.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../../../common_widegts/snack_bar_message/custom_snack_bar.dart';
import '../../riverpod/check.dart';
import 'custom_textformfield.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passController;
  late final TextEditingController confirmPassController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
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
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(
          width: 2.sp,
          color: AppColorScheme.listContainerColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 28.w,
          right: 28.w,
          bottom: 28.h,
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Register", style: titleStyle)],
              ),
              SizedBox(height: 16.h),

              // CustomLabel(labelText: "Full Name"),
              Text("Full Name", style: subTitleStyle),
              SizedBox(height: 4.h),
              CustomTextFormField(
                hintText: "Enter your name",
                controller: nameController,
                textInputAction: TextInputAction.next,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter a valid Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),
              Text("Email", style: subTitleStyle),
              SizedBox(height: 4.h),
              CustomTextFormField(
                hintText: "Enter your email",
                controller: emailController,
                textInputAction: TextInputAction.next,
                // validator: (String? value) {
                //   String emailValue = value ?? '';
                //   if (EmailValidator.validate(emailValue) == false) {
                //     return 'Enter a valid email';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 8.h),
              Text("Password", style: subTitleStyle),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, _) {
                  final isVisible = ref.watch(isObscure1);
                  return CustomTextFormField(
                    hintText: "Enter password",
                    controller: passController,
                    textInputAction: TextInputAction.next,
                    suffixIcon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child:
                          (!isVisible
                              ? SvgPicture.asset(AppIcons.visibilityOff)
                              : SvgPicture.asset(AppIcons.visibilityOn)),
                    ),
                    onSuffixTap: () {
                      ref.read(isObscure1.notifier).state = !isVisible;
                    },
                    obscureText: !isVisible,
                    // validator: (value) {
                    //   if (value == null || value.length < 8) {
                    //     return "Password must be at least 8 characters.";
                    //   }
                    //   if (!RegExp(r'[0-9]').hasMatch(value)) {
                    //     return "Password must include at least one number.";
                    //   }
                    //   return null;
                    // },

                    errorStyle: TextStyle(
                      color: AppColorScheme.softGradGreen,
                      fontSize: 14.sp,
                    ),
                  );
                },
              ),
              SizedBox(height: 8.h),
              Text("Confirm Password", style: subTitleStyle),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, _) {
                  final isVisible = ref.watch(isObscure2);
                  return CustomTextFormField(
                    hintText: "Enter password again",
                    controller: confirmPassController,
                    textInputAction: TextInputAction.done,
                    suffixIcon:
                        (!isVisible
                            ? SvgPicture.asset(AppIcons.visibilityOff)
                            : SvgPicture.asset(AppIcons.visibilityOn)),
                    onSuffixTap: () {
                      ref.read(isObscure2.notifier).state = !isVisible;
                    },
                    obscureText: !isVisible,
                    validator: (value) {
                      return (value != passController.text)
                          ? "Password didn't matched"
                          : null;
                    },
                    errorStyle: TextStyle(
                      color: AppColorScheme.error,
                      fontSize: 14.sp,
                    ),
                  );
                },
              ),
              SizedBox(height: 40.h),
              CustomElevatedButton(
                onPressed: () async {
                  final registerSuccess = await AuthRepositoryImplementation().registerService(nameController.text, emailController.text, passController.text);
                  if ((_formKey.currentState?.validate() ?? false) && (registerSuccess)) {
                    context.go(RouteName.signInScreen);
                  } else {
                    CustomSnackBar.show(
                      context,
                      "Please correct the errors in the form.",
                    );
                  }
                  debugPrint(registerSuccess.toString());
                  debugPrint("\n\n\n\n${nameController.text}\n\n\n\n${emailController.text}\n\n\n\n${passController.text}\n\n\n\n");
                },
                buttonName: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
