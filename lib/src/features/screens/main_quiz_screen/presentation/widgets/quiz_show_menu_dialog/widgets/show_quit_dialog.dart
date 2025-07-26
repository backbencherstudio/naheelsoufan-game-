import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/quit_game_button_header.dart';

import '../../../../../../../core/constant/icons.dart';

void onQuitGameTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 1,
        child: SizedBox(
          height: isPortrait ? 360.h : 90.w,
          width: isPortrait ? null: 860.h,
          child: Stack(
            children: [
              Positioned.fill(
                top: isPortrait ? 26.w : 57.2.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: isPortrait ? 24.w : 52.8.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFB4AB), width: isPortrait ? 3.w : 6.6.h),
                    color: Color(0xffFFDAD6),
                    borderRadius: BorderRadius.circular(isPortrait ? 24.r : 40.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: isPortrait ? 0 : 10.w,),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Are you sure you want to Quit the game?',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff93000A),
                            fontSize: isPortrait ? 28.sp : 9.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: isPortrait ? 40.h: 10.w),
                      HeaderButton(
                        textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: isPortrait ? 22.sp: 9.sp
                        ),
                        textTitle: 'Yes, Quit',
                        gradientColor: LinearGradient(
                          colors: [Color(0xffF80715), Color(0xffA80710)],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isPortrait ? 60.w : 80.h,
                          vertical: isPortrait ? 16.h : 6.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              QuitGameButtonHeader(),

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(
                    child: SvgPicture.asset(AppIcons.cancelSvg),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
