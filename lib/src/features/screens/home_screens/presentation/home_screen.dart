import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/home_screens/widget/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/home_screens/widget/home_widgets/custom_button.dart';
import 'package:naheelsoufan_game/src/features/screens/home_screens/widget/home_widgets/custom_language_container.dart';
import '../../../../core/constant/icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final style = Theme.of(context).textTheme;
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            CustomIconsButtons(icon: AppIcons.cubeIcons, onTap: () {}),
            Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
            CustomIconsButtons(icon: AppIcons.threeDot, onTap: () {}),]),
            SizedBox(height: 200.h),
            Image.asset(AppImages.logo, height: 104.h, width: 300.w),
            SizedBox(height: 50.h,),
            CustomButton(text:"QUICK GMAE" , onTap: () {context.push(RouteName.modeSelectionScreen);},),
            SizedBox(height: 16.h,),
            CustomButton(text:"  GRID STYLE" , onTap: () {  },img: AppIcons.primaryUpsidedown,),
            SizedBox(height: 40.h,),
            CustomLanguageContainer(),
          ],
        ),
      ),
    );
  }
}
