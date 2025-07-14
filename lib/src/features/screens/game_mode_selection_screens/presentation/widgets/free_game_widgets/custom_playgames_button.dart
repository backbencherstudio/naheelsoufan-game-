import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPlaygamesButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomPlaygamesButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Color(0xff2E1126)),
          gradient: LinearGradient(
            colors: [Color(0xffF2E792), Color(0xffF8B133), Color(0xffDE712B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "PLAY",
              style: style.titleMedium!.copyWith(color: Color(0xff2E1126)),
            ),
          ),
        ),
      ),
    );
  }
}
