import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/data/riverpod/loading.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/leaderboard/presentation/widget/leaderBox.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../data/repository/game/start_game/game_stats_service.dart';
import '../../../../../data/riverpod/game/end_game/game_stat_provider.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../../common_widegts/custom_round_button/customRound_button.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(isLoading.notifier).state = true;
      final res = await GetGameStatsService().getGameStats();
      ref.read(gameStatsProvider.notifier).state = res;
      ref.read(isLoading.notifier).state = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final gameStats = ref.watch(gameStatsProvider);
    final championName = gameStats?.data.finalRankings[0].playerName ?? [];
    final loading = ref.watch(isLoading);

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: loading ? Center(
          child: SizedBox(
              height: 50.h,
              width: 50.h,
              child: const CircularProgressIndicator()),
        ) : (gameStats == null) ?
        Center(child:Text("No Data Found!")) :
        SingleChildScrollView(
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
                          },
                        );
                      }
                  ),

                  Text(
                    "Congratulation\n“$championName”",
                    textAlign: TextAlign.center,
                    style: style.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomPopUpMenu(),
                ],
              ),

              SizedBox(height: 20.h),
              Leaderbox(),
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
                  CustomroundButton(
                      icon: AppIcons.playButtn,
                      onTap: () {}
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}