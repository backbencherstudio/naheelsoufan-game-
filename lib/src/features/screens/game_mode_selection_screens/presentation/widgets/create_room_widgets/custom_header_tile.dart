import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeaderTile extends StatelessWidget {
  const CustomHeaderTile({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(0xff555A92),

      ),
      child:Column(
        children: [
          Text("ENJOY 1 FREE GAME",
          style: style.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: Color(0xffE0E0FF),
          ),
          
          ),
          SizedBox(height: 8,),
          Text("1 Game, Maximum 4 Player in a room",
          style: style.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: Color(0xffE0E0FF),
          ),
          
          ),
        ],
      ) ,
    );
  }
}