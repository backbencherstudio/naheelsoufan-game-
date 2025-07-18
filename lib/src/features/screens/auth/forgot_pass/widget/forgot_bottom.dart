import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/route_name.dart';
import '../../register/presentation/widget/custom_label.dart';

class ForgotBottom extends StatelessWidget {
  const ForgotBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLabel(labelText: "Password remembered? "),
        InkWell(
          onTap: ()=>context.go(RouteName.signInScreen),
          child: Text(
            'Sign in',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFFFFFFFF),
              fontSize: 16.sp,
              color: Color(0xFFE0E0FF),
            ),
          ),
        ),
      ],
    );
  }
}
