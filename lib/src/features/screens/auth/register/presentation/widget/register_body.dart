import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../../../common_widegts/snack_bar_message/custom_snack_bar.dart';
import '../../../riverpod/auth_providers.dart';
import '../../../widget/custom_textformfield.dart';

class RegisterBody extends ConsumerStatefulWidget {
  const RegisterBody({super.key});

  @override
  ConsumerState<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends ConsumerState<RegisterBody> {
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
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (prev, next) {
      next.whenOrNull(
        data: (success) {
          if (success) {
            context.go(RouteName.signInScreen);
            CustomSnackBar.show(context, "Registration Successful.");
          } else {
            CustomSnackBar.show(context, "Registration failed.");
          }
        },
        error: (err, _) {
          CustomSnackBar.show(context, err.toString());
        },
      );
    });


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
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
        child: Form(
          autovalidateMode: AutovalidateMode.onUnfocus,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Register", style: titleStyle)),
              SizedBox(height: 16.h),

              Text("Full Name", style: subTitleStyle),
              SizedBox(height: 4.h),
              CustomTextFormField(
                hintText: "Enter your name",
                controller: nameController,
                validator: (value) =>
                (value?.trim().isEmpty ?? true) ? 'Enter a valid Name' : null,
              ),
              SizedBox(height: 8.h),

              Text("Email", style: subTitleStyle),
              SizedBox(height: 4.h),
              CustomTextFormField(
                hintText: "Enter your email",
                controller: emailController,
              ),
              SizedBox(height: 8.h),

              Text("Password", style: subTitleStyle),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, __) {
                  final isVisible = ref.watch(isObscure1);
                  return CustomTextFormField(
                    hintText: "Enter password",
                    controller: passController,
                    obscureText: !isVisible,
                    suffixIcon: InkWell(
                      onTap: () => ref.read(isObscure1.notifier).state = !isVisible,
                      child: SvgPicture.asset(
                        isVisible ? AppIcons.visibilityOn : AppIcons.visibilityOff,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 8.h),

              Text("Confirm Password", style: subTitleStyle),
              SizedBox(height: 4.h),
              Consumer(
                builder: (_, ref, __) {
                  final isVisible = ref.watch(isObscure2);
                  return CustomTextFormField(
                    hintText: "Enter password again",
                    controller: confirmPassController,
                    obscureText: !isVisible,
                    validator: (value) {
                      return (value != passController.text)
                          ? "Password didn't match"
                          : null;
                    },
                    suffixIcon: InkWell(
                      onTap: () => ref.read(isObscure2.notifier).state = !isVisible,
                      child: SvgPicture.asset(
                        isVisible ? AppIcons.visibilityOn : AppIcons.visibilityOff,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40.h),

              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ref.read(authNotifierProvider.notifier).register(nameController.text, emailController.text, passController.text);
                  } else {
                    CustomSnackBar.show(
                      context,
                      "Please correct the errors in the form.",
                    );
                  }
                },
                buttonName: authState.isLoading ? "Registering..." : "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
