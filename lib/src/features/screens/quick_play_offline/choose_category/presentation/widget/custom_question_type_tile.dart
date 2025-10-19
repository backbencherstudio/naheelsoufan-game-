import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomQuestionTypeTile extends StatelessWidget {
  final bool isSelected;
  final String imgUrl;
  final String title;
  final int questionNumber;
  final void Function()? onTap;
  const CustomQuestionTypeTile({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
    required this.imgUrl,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 160.h,
        width: 112.w,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 5.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 9.h),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 6.w,
                    right: 6.w,
                    bottom: 8.h,
                    top: 20.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border:
                        isSelected
                            ? Border.all(
                              color: AppColorScheme.yellowborder,
                              width: 2.w,
                            )
                            : Border.all(
                              color: AppColorScheme.greenborder,
                              width: 2.w,
                            ),
                    gradient:
                        isSelected
                            ? LinearGradient(
                              colors: [
                                AppColorScheme.softYellow,
                                AppColorScheme.midYellow,
                                AppColorScheme.darkYellow,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                            : LinearGradient(
                              colors: [
                                AppColorScheme.startGradGreen,
                                AppColorScheme.midGradGreen,
                                AppColorScheme.hardGradGreen,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                  ),

                  child: Column(
                    children: [
                      Image.network(imgUrl),
                      SizedBox(height: 12.h),
                      Text(
                        "$questionNumber Question(s)",
                        style: style.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColorScheme.greenTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 24.h,
                width: 100.w,
                padding: const EdgeInsets.all(4.0),

                margin: EdgeInsets.symmetric(horizontal: 4.w),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient:
                      isSelected
                          ? LinearGradient(
                            colors: [
                              Color(0xffF2E792),
                              Color(0xffF8B133),
                              Color(0xffDE712B),
                            ],

                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                          : LinearGradient(
                            colors: [
                              Color(0xffB8F1B9),
                              Color(0xffB8F1B9),
                              Color(0xffB8F1B9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: style.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2E1126),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
