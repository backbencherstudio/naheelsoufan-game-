import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonsNormal extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;
  final String title;
  const CustomButtonsNormal({super.key,
  required this.isSelected,
  required this.onTap,
  required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 14.h),
        child: Container(
          padding: EdgeInsets.all(16.r),
        
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient:isSelected?  
            
             LinearGradient(
              colors: [Color(0xffF2E792), Color(0xffF8B133), Color(0xffDE712B)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ) : LinearGradient(
              colors: [Color(0xff3D4279), Color(0xff3D4279), Color(0xff3D4279)],
             
            ),
            border: Border(
              bottom: BorderSide(color:isSelected?  Color(0xffFFB4AB) : Color(0xff00024C), width: 4.w),
            ),
          ),
        
          child: Center(
            child: Text(
              title,
              style: style.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color:isSelected? Color(0xff000000) : Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
