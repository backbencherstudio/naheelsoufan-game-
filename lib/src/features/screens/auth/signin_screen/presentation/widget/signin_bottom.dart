import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routes/route_name.dart';

class SignInBottom extends StatelessWidget {
  const SignInBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final linkTextStyle = Theme.of(context).textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have any account? ", style: linkTextStyle,),
        InkWell(
          onTap: ()=>context.go(RouteName.registerScreen),
          child: Text(
            'Register',
            style: linkTextStyle?.copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
