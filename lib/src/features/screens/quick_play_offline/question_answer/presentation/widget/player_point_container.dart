import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/player_pointBlock.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../../provider/toggle.dart';

class PlayerPointContainer extends StatelessWidget {
  const PlayerPointContainer({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Container(
      height: 169.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColorScheme.playerContainerColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            SizedBox(
              height: 145.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 12.h,
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      decoration: BoxDecoration(
                        color: AppColorScheme.containerColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                  Positioned(
                    child: VsScrollbar(
                      controller: scrollController,
                      showTrackOnHover: true,
                      isAlwaysShown: true,
                      scrollbarFadeDuration: const Duration(milliseconds: 500),
                      scrollbarTimeToFade: const Duration(milliseconds: 800),
                      style: VsScrollbarStyle(
                        hoverThickness: 10.0,
                        radius: Radius.circular(20.r),
                        thickness: 8.0,
                        color: AppColorScheme.scrollbarColor,
                      ),
                      child: Consumer(
                          builder: (_, ref, _) {
                            final current = ref.read(playerProvider);
                            final playerNameList = ref.watch(playerNameProvider.notifier).playerNames;
                            // CHANGE
                            final isStealMode = ref.watch(huntModeOn);
                            // CHANGE
                            final clickState = ref.watch(selectedPlayerIndexProvider);
                            final checkAns = ref.watch(isRightWrongElse);
                            return ListView.builder(
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 33.h),
                              itemCount: current.totalPlayer,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: (!isStealMode) ? (PlayerPointBlock(
                                    blockCardState: (
                                        (checkAns == 1 && current.currentPlayer == (index) % current.totalPlayer)
                                            ? 1
                                            : (current.currentPlayer == index)
                                            ? 2
                                            : -1),
                                    playerName: playerNameList[index],
                                    points: 0,

                                  )) : GestureDetector(
                                    onTap: (){
                                      ref.read(selectedPlayerIndexProvider.notifier).state = index;
                                    },
                                    child: (PlayerPointBlock(
                                      blockCardState: ((clickState == index && checkAns == 1)
                                          ? 1
                                      //CHANGE
                                          : (current.currentPlayer == (index) % current.totalPlayer && current.totalPlayer != (index + 1) % current.totalPlayer)
                                      //CHANGE
                                          ? 0
                                          : (clickState == index)
                                          ? 2
                                          : 3),
                                      playerName: playerNameList[index],
                                      points: 0,
                                    )),
                                  ),
                                );
                              },
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}