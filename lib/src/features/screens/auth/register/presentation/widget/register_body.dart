import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/text_theme.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
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
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final subTitleStyle = Theme.of(context).textTheme.displaySmall;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF3D4279),
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(
          width: 2.sp,
          color: Color(0xFFE0E0FF),
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
                children: [
                  Text(
                    "Register",
                    style: titleStyle,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text("Full Name", style: subTitleStyle,),
              SizedBox(height: 4.h),
              CustomTextFormField(
                hintText: "Enter your name",
                controller: nameController,
              ),
              SizedBox(height: 8.h),
              Text("Email", style: subTitleStyle,),
              SizedBox(height: 4.h),
              CustomTextFormField(
                hintText: "Enter your email",
                controller: emailController,
              ),
              SizedBox(height: 8.h),
              Text("Password", style: subTitleStyle,),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, _) {
                  final isVisible = ref.watch(isObscure1);
                  return CustomTextFormField(
                    hintText: "Enter password",
                    controller: passController,
                    suffixIcon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child: (!isVisible
                          ? SvgPicture.asset(
                        AppIcons.visibilityOff,
                      )
                          : SvgPicture.asset(
                        AppIcons.visibilityOn,
                      )),
                    ),
                    onSuffixTap: () {
                      ref.read(isObscure1.notifier).state =
                      !isVisible;
                    },
                    obscureText: !isVisible,
                    validator: (value){
                      return (value!.length < 8) ? "At least 8 characters long, and one number." : null;
                    },
                    errorStyle: TextStyle(color: Color(0xFFB8F1B9), fontSize: 14.sp),
                  );
                },
              ),
              SizedBox(height: 8.h),
              Text("Confirm Password", style: subTitleStyle,),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, _) {
                  final isVisible = ref.watch(isObscure2);
                  return CustomTextFormField(
                    hintText: "Enter password again",
                    controller: confirmPassController,
                    suffixIcon: (!isVisible
                        ? SvgPicture.asset(
                      AppIcons.visibilityOff,
                    )
                        : SvgPicture.asset(
                      AppIcons.visibilityOn,
                    )),
                    onSuffixTap: () {
                      ref.read(isObscure2.notifier).state =
                      !isVisible;
                    },
                    obscureText: !isVisible,
                    validator: (value){
                      return (value != passController.text) ? "Password didn't matched" : null;
                    },
                    errorStyle: TextStyle(color: Color(0xFFFF5449), fontSize: 14.sp),
                  );
                },
              ),
              SizedBox(height: 40.h),
              CustomElevatedButton(
                onPressed: () {
                  context.go(RouteName.signInScreen);
                }, buttonName: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
