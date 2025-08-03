import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/player_pointBlock.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/stateProvider.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 145.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 12.0,
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
                          final isStealMode = ref.watch(isCorrectQuiz);
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
                                      (checkAns == 1 && current.currentPlayer == (index + 1) % current.totalPlayer)
                                          ? 1
                                          : (current.currentPlayer == index)
                                          ? 2
                                          : -1),
                                  playerNo: index + 1,
                                  points: 50,
                                )) : GestureDetector(
                                  onTap: (){
                                    ref.read(selectedPlayerIndexProvider.notifier).state = index;
                                  },
                                  child: (PlayerPointBlock(
                                    blockCardState: ((clickState == index && checkAns == 1)
                                        ? 1
                                        : (current.currentPlayer == (index + 1) % current.totalPlayer && current.totalPlayer != index + 1)
                                        ? 0
                                        : (clickState == index)
                                        ? 2
                                        : 3),
                                    playerNo: index + 1,
                                    points: 50,
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
