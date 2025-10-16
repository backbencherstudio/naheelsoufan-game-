import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../../core/routes/route_name.dart';


class OtpScreenBottom extends StatelessWidget {
  const OtpScreenBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final linkTextStyle = Theme.of(context).textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Didn't get the code? ", style: linkTextStyle,),
        InkWell(
          onTap: ()=>context.go(RouteName.signInScreen),
          child: Text(
              'Resent code',
              style: linkTextStyle?.copyWith(decoration: TextDecoration.underline, decorationColor: AppColorScheme.primary)
          ),
        ),
      ],
    );
  }
}
