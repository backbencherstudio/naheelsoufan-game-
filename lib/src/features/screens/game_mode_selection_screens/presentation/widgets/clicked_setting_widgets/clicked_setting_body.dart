import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../riverpod/click_setting_riverpod.dart';

class ClickedSettingBody extends StatelessWidget {
  const ClickedSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle2 = Theme.of(context).textTheme.displayLarge;
    final titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
        color: AppColorScheme.labelTextColor
    );
    final bodyTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: AppColorScheme.primary,
      fontWeight: FontWeight.w400,
    );

    final bodyTextStyle2 = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
    );
    return Stack(
      children: [
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 24.h),
            decoration: BoxDecoration(
              color: AppColorScheme.deepPuroleBG,
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              border: Border.all(width: 2.r, color: AppColorScheme.primary),
            ),
            child: Padding(padding: EdgeInsets.only(
                top: 16.h,
                left: 28.w,
                right: 28.w,
                bottom: 28.h
            ),
            child: Column(
              children: [
                SizedBox(height: 40.h,),
                SizedBox(
                  height: 88.5.h,
                  width: 88.w,
                  child: Stack(children: [
                    Positioned(right:8.w,top: 8.5.h,child: Image.asset(AppImages.profile, height: 80.h, width: 80.w,)),
                    Positioned(right:0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColorScheme.primary,
                          borderRadius: BorderRadius.circular(8.r)
                        ),
                          padding: EdgeInsets.all(4.r),
                          child: InkWell(onTap: ()=>context.push(RouteName.editProfileScreen),
                              child: SvgPicture.asset(AppIcons.editIcon, colorFilter: ColorFilter.mode(AppColorScheme.deepPuroleBG, BlendMode.srcIn),))
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Change name", style: bodyTextStyle,),
                    SvgPicture.asset(AppIcons.editIcon),
                  ],
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Change password", style: bodyTextStyle,),
                    SvgPicture.asset(AppIcons.editIcon),
                  ],
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Language", style: bodyTextStyle,),
                    Row(
                      children: [
                        Text("US English", style: bodyTextStyle,),
                        SvgPicture.asset(AppIcons.arrowLeft),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Divider(color: AppColorScheme.primary,),
                SizedBox(height: 16.h,),
                Text("TTS Speed", style: bodyTextStyle2,),
                SizedBox(height: 8.h,),
                Consumer(builder:(_, ref,_){
                  final rate = ref.watch(isRated);
                  return Text(ref.read(isRated.notifier).state.toString(), style: titleStyle2,);
                } ),
                SizedBox(height: 24.h,),
                Consumer(
                  builder: (_, ref, _) {
                    final rate = ref.watch(isRated);
                    return Slider(
                      activeColor: AppColorScheme.primary,
                      inactiveColor: AppColorScheme.secondaryFixed,
                      value: rate.toDouble(),
                      onChanged: (newRating){
                        ref.read(isRated.notifier).state = newRating.toInt();
                      },
                      max: 100,
                      min: 0,
                    );
                  }
                ),
                SizedBox(height: 28.h,),
              ],
            ),
          )
              ),
        ),
        Positioned(
          left: 145.w,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(width: 2.w, color: AppColorScheme.labelTextColor),
                gradient: LinearGradient(colors: [
                  AppColorScheme.softYellow,
                  AppColorScheme.midYellow,
                  AppColorScheme.darkYellow
                ],
                    stops: [0, 45.67, 100],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Text("Setting", style: titleStyle,),
          ),
        ),
      ],
          );
  }
}
