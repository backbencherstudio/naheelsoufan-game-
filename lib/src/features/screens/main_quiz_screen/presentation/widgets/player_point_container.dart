import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/player_pointBlock.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/selected_player_index_provider.dart';

class PlayerPointContainer extends ConsumerWidget {
  const PlayerPointContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController = ScrollController();

    final selectedIndex = ref.watch(selectedPlayerIndexProvider);

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
                      child: ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 33.h),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: GestureDetector(
                              onTap: () {
                                //ref.read(selectedPlayerIndexProvider.notifier).state = index;
                              },
                              child: PlayerPointblock(
                                isSelected: index == selectedIndex,
                                playerName: 'Player ${index + 1}',
                                points: 1000,
                              ),
                            ),
                          );
                        },
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
