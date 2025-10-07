import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/custom_box.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/custom_first_place.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/custom_row.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../../../../../../data/riverpod/game/end_game/game_stat_provider.dart';
import 'custom_place_box.dart';

class Leaderbox extends ConsumerWidget {
  const Leaderbox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    final gameStats = ref.watch(gameStatsProvider);
    final players = gameStats?.data.finalRankings ?? [];
    final playerLength = players.length;

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
                        isPortrait
                            ? (playerLength > 1
                            ? CustomPlaceBox(
                          place: 2,
                          name: players[1].playerName,
                          scores: players[1].score,
                        )
                            : SizedBox())
                            : SizedBox(),
                        (playerLength > 0
                            ? CustomFirstPlace(name: players[0].playerName, scores: players[0].score)
                            : SizedBox()),
                        isPortrait
                            ? (playerLength > 2
                            ? CustomPlaceBox(
                          place: 3,
                          name: players[2].playerName,
                          scores: players[2].score,
                        )
                            : SizedBox())
                            : (playerLength > 1
                            ? CustomPlaceBox(
                          place: 2,
                          name: players[1].playerName,
                          scores: players[1].score,
                        )
                            : SizedBox()),
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
                                children: List.generate(playerLength, (index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 9.h),
                                    child: CustomRow(
                                      name: players[index].playerName,
                                      scores: players[index].score,
                                      right: players[index].correctAnswers,
                                      wrong: players[index].wrongAnswers,
                                      skip: players[index].skippedAnswers,
                                      index: index + 1,
                                    ),
                                  );
                                }),
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
