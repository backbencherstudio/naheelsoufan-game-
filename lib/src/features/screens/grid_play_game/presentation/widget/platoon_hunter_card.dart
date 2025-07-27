import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/theme/theme_extension/color_scheme.dart';

class PlatoonHunterCard extends StatelessWidget {
  final String cardName;
  final int? index;
  static const List<String> cardStatus = ["inactive", "active", "wrong", "right"];

  const PlatoonHunterCard({
    super.key,
    required this.cardName,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    final finalIndex = index ?? 0;
    final textTheme = Theme.of(context).textTheme;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return (cardStatus[finalIndex] == "active")?Container(
      padding: EdgeInsets.all(isPortrait ? 4.4.r : 5.r),
      width: isPortrait ? 104.w : 228.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isPortrait ?12.r: 26.4.r),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(34, 34, 34, 0.20),
            offset: Offset(0, 4), // x: 0, y: 4
            blurRadius: 25,
            spreadRadius: 0,
          )
        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColorScheme.darkYellow,
              AppColorScheme.midYellow,
              AppColorScheme.yellowborder,
            ]),
        //Color(0xFF6B71B9),
        border: Border(bottom: BorderSide(width: isPortrait ? 3.w : 6.6.h, color: Color(0xFF52589F))),
      ),
      child: Container(
        padding: EdgeInsets.all(isPortrait ? 12.r : 26.4.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isPortrait ?12.r: 26.4.r),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColorScheme.darkYellow,
                  AppColorScheme.midYellow,
                  AppColorScheme.yellowborder,
                ])
        ),
        child: Column(
          children: [
            SvgPicture.asset(AppIcons.groupProfile, height: 52.8.h, width: 52.8.h,),
            RichText(text: TextSpan(text: cardName, style: textTheme.displayMedium?.copyWith(
                fontSize: isPortrait ? 16.sp : 7.2.sp
            ))),
          ],
        ),
      ),
    ):(cardStatus[finalIndex] == "inactive")? Container(
      padding: EdgeInsets.all(isPortrait ? 12.r : 26.4.r),
      width: isPortrait ? 104.w : 228.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(34, 34, 34, 0.20),
            offset: Offset(0, 4), // x: 0, y: 4
            blurRadius: 25,
            spreadRadius: 0,
          )
        ],
        color: Color(0xFF6B71B9),
        borderRadius: BorderRadius.circular(isPortrait ? 12.r : 26.4.r),
        border: Border(bottom: BorderSide(width: isPortrait ? 3.w : 6.6.h, color: Color(0xFF52589F))),
      ),
      child: Column(
        children: [
          SvgPicture.asset(AppIcons.groupProfile, width: isPortrait ? 24.w : 52.8.h,),
          RichText(text: TextSpan(text: cardName, style: textTheme.displayMedium?.copyWith(
              fontSize: isPortrait ? 16.sp : 7.2.sp
          ))),
        ],
      ),
    ):Container(
      padding: EdgeInsets.all(isPortrait ? 12.r : 26.4.r),
      width: isPortrait ? 104.w : 228.h,
      decoration: BoxDecoration(
        color: Color(0xFF52589F),
        borderRadius: BorderRadius.circular(isPortrait ? 12.r : 26.4.r),
        border: Border(bottom: BorderSide(width: isPortrait ? 3.w : 6.6.h, color: Color(0xFF6B71B9))),
      ),
      child: Column(
        children: [
          SvgPicture.asset(AppIcons.groupProfile, width: isPortrait ? 24.w : 52.8.h,),
          RichText(text: TextSpan(text: cardName, style: textTheme.displayMedium?.copyWith(
              fontSize: isPortrait ? 16.sp : 7.2.sp
          ))),
        ],
      ),
    );
  }
}
