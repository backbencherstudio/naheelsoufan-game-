import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/riverpod/forget_pass_riverpod.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../riverpod/reset_pass_riverpod.dart';
import '../../../widget/custom_textformfield.dart';

class ForgotBody extends ConsumerStatefulWidget {
  const ForgotBody({super.key});

  @override
  ConsumerState<ForgotBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends ConsumerState<ForgotBody> {
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final subTitleStyle = Theme.of(context).textTheme.displaySmall;

    // Watch the forget password state inside Consumer
    return Consumer(
      builder: (context, ref, _) {
        final forgetPassState = ref.watch(forgetPasswordProvider);

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forget Password?",
                      style: titleStyle,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  "Enter your email to reset password",
                  style: subTitleStyle?.copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("Email", style: subTitleStyle),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  hintText: "Enter your email",
                  controller: emailController,
                ),
                SizedBox(height: 40.h),
                CustomElevatedButton(
                  onPressed: () async {
                    final email = emailController.text.trim();
                    if (email.isNotEmpty) {
                      final result = await ref.read(forgetPasswordProvider.notifier).forgetPassword(email: email);
                      final forgetPassState = ref.read(forgetPasswordProvider);

                      final notifier = ref.read(resetPasswordProvider.notifier);
                      notifier.setEmail(email);

                      if (result) {
                        context.push(RouteName.verifyOtpScreen);
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            forgetPassState.message ?? (result ? 'Verification code sent.' : 'Something went wrong'),
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please enter a valid email',
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    }
                  },

                  buttonName: forgetPassState.isLoading ? "Sending..." : 'Send',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
