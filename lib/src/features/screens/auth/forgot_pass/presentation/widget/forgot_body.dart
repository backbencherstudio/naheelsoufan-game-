import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../widget/custom_textformfield.dart';

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
            Text("Enter your email to reset password",
              style: subTitleStyle?.copyWith(fontSize: 16.sp), textAlign: TextAlign.center,),
            SizedBox(height: 16.h),
            Align(alignment: AlignmentDirectional.centerStart, child: Text("Email", style: subTitleStyle,)),
            SizedBox(height: 4.h),
            CustomTextFormField(
              hintText: "Enter your email",
              controller: emailController,
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPressed: () {
                context.push(RouteName.verifyOtpScreen);
              }, buttonName: 'Send',
            ),
          ],
        ),
      ),
    );
  }
}
