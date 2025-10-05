import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/model/start_game/game_result_model.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/Custom_placeBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/custom_box.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/row_arrangment/custom_row.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/row_arrangment/custom_rowThree.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/row_arrangment/customrowTwo.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import 'customFisrtPlace.dart';

class Leaderbox extends StatelessWidget {
  final List<FinalRanking> playerRankings;


  const Leaderbox({
    super.key, required this.playerRankings,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return CustomContainerBox(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff3D4279).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
          children: [
            if (!isPortrait) ...[
              Positioned(
                top: 40.h,
                right: 10.w,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: isPortrait ? 13.h : 120.w,
                    width: isPortrait ? null : 5.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: isPortrait ? 2.w : 0,
                      vertical: isPortrait ? 0 : 4.4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColorScheme.containerColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ),
            ],
            Positioned(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: isPortrait ? 20.w : 44.h,
                      top: isPortrait ? 20.h : 9.w,
                      bottom: isPortrait ? 20.h : 9.w,
                      right: isPortrait ? 20.w : 44.h,
                    ),
                    child: Row(
                      mainAxisAlignment:
                          isPortrait
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        isPortrait ? CustomPlacebox(place: 2) : SizedBox(),
                        Customfisrtplace(),
                        isPortrait
                            ? CustomPlacebox(place: 3)
                            : CustomPlacebox(place: 2),
                      ],
                    ),
                  ),
                  SizedBox(height: isPortrait ? 10.h : 4.5.w),
                  Stack(
                    children: [
                      if (isPortrait) ...[
                        Positioned(
                          top: 5,
                          bottom: 1,
                          left: 5,
                          right: 5,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: isPortrait ? 13.h : 150.w,
                              width: isPortrait ? null : 5.w,
                              margin: EdgeInsets.symmetric(
                                horizontal: isPortrait ? 2.w : 0,
                                vertical: isPortrait ? 0 : 4.4.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColorScheme.containerColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                      Positioned(
                        child: VsScrollbar(
                          controller: scrollController,
                          showTrackOnHover: true,
                          isAlwaysShown: true,
                          scrollbarFadeDuration: const Duration(
                            milliseconds: 500,
                          ),
                          scrollbarTimeToFade: const Duration(
                            milliseconds: 800,
                          ),
                          style: VsScrollbarStyle(
                            hoverThickness: 10.0,
                            radius: Radius.circular(20.r),
                            thickness: 8.0,
                            color: AppColorScheme.scrollbarColor,
                          ),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: isPortrait ? 20.w : 44.h,
                                right: isPortrait ? 20.w : 44.h,
                                bottom: isPortrait ? 30.h : 13.5.w,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    isPortrait
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: isPortrait ? 20.h : 9.w),
                                  CustomRow(
                                    id: '01',
                                    name: playerRankings[0].playerId,
                                    scores: playerRankings[0].score.toString(),
                                    right: playerRankings[0].correctAnswers.toString(),
                                    wrong: playerRankings[0].wrongAnswers.toString(),
                                    skip: playerRankings[0].skippedAnswers.toString(),
                                  ),
                                  SizedBox(height: isPortrait ? 10.h : 4.5.w),
                                  Customrowtwo(
                                    id: '02',
                                    name: playerRankings[1].playerId,
                                    scores: playerRankings[1].score.toString(),
                                    icons: AppImages.award,
                                    right: playerRankings[1].correctAnswers.toString(),
                                    wrong: playerRankings[1].wrongAnswers.toString(),
                                    skip: playerRankings[1].skippedAnswers.toString(),
                                  ),
                                  if (isPortrait) ...[
                                    SizedBox(height: isPortrait ? 10.h : 4.5.w),
                                    Customrowtwo(
                                      id: '03',
                                      name: playerRankings[2].playerId,
                                      scores: playerRankings[2].score.toString(),
                                      icons: AppImages.madel,
                                      right: playerRankings[2].correctAnswers.toString(),
                                      wrong: playerRankings[2].wrongAnswers.toString(),
                                      skip: playerRankings[2].skippedAnswers.toString(),
                                    ),
                                    SizedBox(height: isPortrait ? 10.h : 4.5.w),
                                    CustomRowthree(
                                      id: '04',
                                      name: playerRankings[3].playerId,
                                      scores: playerRankings[3].score.toString(),
                                      right: playerRankings[3].correctAnswers.toString(),
                                      wrong: playerRankings[3].wrongAnswers.toString(),
                                      skip: playerRankings[3].skippedAnswers.toString(),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isPortrait ? 20.h : 9.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
