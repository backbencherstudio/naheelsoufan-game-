import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../register/presentation/widget/custom_label.dart';
import '../../register/presentation/widget/custom_textformfield.dart';

class ForgotBody extends StatefulWidget {
  const ForgotBody({super.key});

  @override
  State<ForgotBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<ForgotBody> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text("Enter your email to reset password, we’ll send a link", style: TextStyle(
                fontSize: 16.sp,
              color: Color(0xFFFFFFFF)
            ),),
            SizedBox(height: 16.h),
            CustomLabel(labelText: "Email"),
            SizedBox(height: 4.h),
            CustomTextFormField(
              hintText: "Enter your email",
              controller: emailController,
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPressed: () {
                context.go(RouteName.forgetPasswordLinkSentScreen);
              }, buttonName: 'Send link',
            ),
          ],
        ),
      ),
    );
  }
}
