import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';
import '../../../widget/custom_textformfield.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({super.key});

  @override
  State<OtpScreenBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<OtpScreenBody> {
  late final TextEditingController _pinInputTEController;

  @override
  void initState() {
    super.initState();
    _pinInputTEController = TextEditingController();
  }

  @override
  void dispose() {
    _pinInputTEController.dispose();
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
        border: Border.all(width: 2.sp, color: Color(0xFFE0E0FF)),
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
              children: [Text("Verify Code", style: titleStyle)],
            ),
            SizedBox(height: 12.h),
            Text(
              "Enter OTP to reset password",
              style: subTitleStyle?.copyWith(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text("OTP", style: subTitleStyle),
            ),
            SizedBox(height: 4.h),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              controller: _pinInputTEController,
              appContext: context,
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColorScheme.primaryTextColor,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8.r),
                fieldHeight: 50.h,
                fieldWidth: 45.w,
                activeColor: AppColorScheme.whiteBg,
                inactiveColor: AppColorScheme.white,
                selectedColor: AppColorScheme.primary,
                activeFillColor: AppColorScheme.whiteBg,
                inactiveFillColor: AppColorScheme.white,
                selectedFillColor: AppColorScheme.primary,
                borderWidth: 1.w, // Match border width
              ),
              cursorColor: const Color(0xff3D4279),
              validator: (String? value) {
                String pin = value?.trim() ?? '';
                final RegExp pinRegex = RegExp(r'^\d{6}$');
                if (pinRegex.hasMatch(pin) == false) {
                  return 'Please enter valid Pin';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),

            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPressed: () {
                context.push(RouteName.resetPasswordScreen);
              },
              buttonName: 'Send',
            ),
          ],
        ),
      ),
    );
  }
}
