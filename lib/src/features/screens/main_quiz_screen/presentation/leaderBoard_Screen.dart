import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/data/repository/game/start_game/game_stats_service.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/customRound_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/leaderBox.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/riverpod/common_disposer.dart';
import '../../../../data/riverpod/game/end_game/game_stat_provider.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final res = await GetGameStatsService().getGameStats();
      ref.read(gameStatsProvider.notifier).state = res;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final gameStats = ref.watch(gameStatsProvider);
    final gamePlayers = gameStats?.data.finalRankings ?? [];

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer(
                  builder: (_, ref, _) {
                    return CustomIconsButtons(
                      icon: AppIcons.backIcons,
                      onTap: () {
                        context.go(RouteName.gameModeScreens);
                        ref.read(commonProviderDisposer)();
                      },
                    );
                  }
                ),

                Text(
                  "Congratulation\n${gameStats?.data.finalRankings[0].playerName ?? ''}",
                  textAlign: TextAlign.center,
                  style: style.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomPopUpMenu(),
              ],
            ),

            SizedBox(height: 20.h),
            Leaderbox(
              playerRankings: gamePlayers,
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomroundButton(
                  icon: AppIcons.reload,
                  onTap: () {},
                  bgIcon: AppIcons.roundIcontop,
                ),
                SizedBox(width: 40.w),
                CustomroundButton(icon: AppIcons.playButtn, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}