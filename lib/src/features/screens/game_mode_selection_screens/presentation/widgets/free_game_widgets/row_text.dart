import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowText extends StatelessWidget {
  final String title;
  final String description;

  const RowText({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: style.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Color(0xff2E1126),
            ),
          ),
        ),
        // SizedBox(width: 20), 
        Expanded(
          child: Text(
            ": $description",
            style: style.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Color(0xff2E1126),
            ),
            textAlign: TextAlign.left, 
          ),
        ),
      ],
    );
  }
}
