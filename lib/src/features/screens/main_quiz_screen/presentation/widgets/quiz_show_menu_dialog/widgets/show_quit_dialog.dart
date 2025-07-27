import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/quit_game_button_header.dart';

import '../../../../../../../core/constant/icons.dart';

void onQuitGameTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 1,
        child: SizedBox(
          height: 360.h,
          child: Stack(
            children: [
              Positioned.fill(
                top: 26,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFB4AB), width: 3),
                    color: Color(0xffFFDAD6),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Are you sure you want to Quit the game?',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff93000A),
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),

                      HeaderButton(
                        onTap: () {
                          context.go(RouteName.modeSelectionScreen);
                        },
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        textTitle: 'Yes, Quit',
                        gradientColor: LinearGradient(
                          colors: [Color(0xffF80715), Color(0xffA80710)],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 60.w,
                          vertical: 16.h,
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
