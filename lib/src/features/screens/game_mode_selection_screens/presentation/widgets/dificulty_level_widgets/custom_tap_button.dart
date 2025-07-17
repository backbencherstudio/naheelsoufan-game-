import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTapButton extends StatelessWidget {
  const CustomTapButton({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(colors: [
          
          Color(0xff1D5128),
            Color(0xff14BA37),
            Color(0xff1D5128),

        ],
                stops: [0.0, 1.0,0.1],

        begin: Alignment.bottomLeft,
        end: Alignment.topRight
        )

      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
        child: Container(
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(colors: [
            Color(0xff1D5128),
            Color(0xff14BA37),
            Color(0xff1D5128),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          )
        
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text("Difficulty Level",
          style: style.headlineLarge!.copyWith(
            fontWeight: FontWeight.w500
          )
          ),
        ),
        
        
        
        
        ),
      ),
    );
  }
}