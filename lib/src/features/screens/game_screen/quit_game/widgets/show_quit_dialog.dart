import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/features/screens/game_screen/choose_difficulty/widgets/common_button_header.dart';
import '../../../../../core/constant/icons.dart';

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
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff93000A),
                                fontSize: 28.sp,
                              ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      SizedBox(
                        child: Expanded(
                          child: CommonButtonHeader(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: CommonButtonHeader(
                  textTitle: 'Quit Game?',
                  borderColor: Color(0xffA80710),
                  gradientColor: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFA80710),
                      Color(0xFFFF897D),
                      Color(0xFFA80710),
                    ],
                    stops: [0.0, 0.4904, 1.0],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(child: SvgPicture.asset(AppIcons.cancelSvg)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
