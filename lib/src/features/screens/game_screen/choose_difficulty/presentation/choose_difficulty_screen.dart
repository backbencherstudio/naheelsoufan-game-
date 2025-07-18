import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/features/screens/game_screen/question_answer/widgets/primary_button.dart';
import '../../../../../core/constant/icons.dart';
import '../../common_widgets/app_bar_icons.dart';
import '../../common_widgets/app_screen_background.dart';
import '../../quit_game/widgets/show_quit_dialog.dart';
import '../widgets/common_button_header.dart';
import '../widgets/difficulty_level.dart';

class ChooseDifficultyScreen extends StatelessWidget {
  const ChooseDifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScreenBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Column(
            children: [
              AppBarIcons(),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Player 1',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Color(0xffE0E0FF),
                  ),
                ),
              ),
              SizedBox(height: 61.h),
              SizedBox(
                height: 465.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 28.h,
                      child: Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: Color(0xff52589F),
                          border: Border.all(
                            color: Color(0xffF2E792),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 54.h),
                                DifficultyLevel(title: 'EASY'),
                                SizedBox(height: 14.h),
                                DifficultyLevel(title: 'MEDIUM'),
                                SizedBox(height: 14.h),
                                DifficultyLevel(title: 'HARD'),
                              ],
                            ),
                            SizedBox(height: 44.h),
                            GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                width: 229.w,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: SvgPicture.asset(
                                        AppIcons.primaryButtonSvg,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Start',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffffffff),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),
                    ),
                    CommonButtonHeader(
                      textTitle: 'Difficulty Level',
                      borderColor: Color(0xff1D5128),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: ClipOval(
                          child: SvgPicture.asset(AppIcons.cancelSvg),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
