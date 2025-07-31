import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../../core/routes/route_name.dart';


class ForgotBottom extends StatelessWidget {
  const ForgotBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final linkTextStyle = Theme.of(context).textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Password remembered? ", style: linkTextStyle,),
        InkWell(
          onTap: ()=>context.go(RouteName.signInScreen),
          child: Text(
            'Sign in',
            style: linkTextStyle?.copyWith(decoration: TextDecoration.underline, decorationColor: AppColorScheme.primary)
          ),
        ),
      ],
    );
  }
}
