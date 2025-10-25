import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/data/repository/game/game_mode/select_game_mode_service.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/constant/padding.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/repository/subscription/subscription_service.dart';
import '../../../../data/riverpod/player_game/player_game_controller.dart';
import '../../../../data/riverpod/subscription/subscription_controller.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../auth/riverpod/auth_providers.dart';
import '../../quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import '../../setting/widgets/language_drop_down_menu.dart';
import '../riverpod/mode_controller.dart';

class GameModeScreens extends ConsumerStatefulWidget {
  const GameModeScreens({super.key});

  @override
  _GameModeScreensState createState() => _GameModeScreensState();
}
class _GameModeScreensState extends ConsumerState<GameModeScreens> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(userSubscriptionDataProvider.notifier).state = await SubscriptionService().fetchUserSubscription();
      ref.read(playerGameProvider.notifier).fetchGames();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final menuKey = GlobalKey();
    final userData = ref.watch(authNotifierProvider);
    final userGameData = ref.watch(playerGameProvider);
    final userSubscriptionData = ref.watch(userSubscriptionDataProvider);

    return Scaffold(
      body: CreateScreen(
        keys: keys,
        child: userData.when(
          data: (user) {
            return Padding(
              padding: AppPadding.horizontalPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconsButtons(
                        icon: AppIcons.cubeIcons,
                        onTap: () {
                          keys.currentState?.openDrawer();
                        },
                      ),
                      SizedBox()
                    ],
                  ),
                  SizedBox(height: 200.h),
                  Image.asset(AppImages.logo, height: 104.h, width: 300.w),
                  SizedBox(height: 50.h),
                  CustomButton(
                    text: "QUICK GAME",
                    onTap: () async {
                      context.push(RouteName.modeSelectionScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    text: "GRID STYLE",
                    onTap: () async {
                      ref.read(modeProvider.notifier).state = 3;
                      if(userSubscriptionData?.data != null || userSubscriptionData?.data.gamesRemaining == 0) {
                        final selectGameMode = SelectGameModeService();
                        final result = await selectGameMode.createGame(
                          context: context,
                          gameMode: 3,
                        );
                        (result == true) ? debugPrint("Game Created Successfully") : debugPrint("Game Creation Unsuccessful");
                        context.push(RouteName.enterTeamNameScreen);
                      }
                      else {
                        (userGameData?.data.summary.gridStyleGamesCreated == 0) ?
                        context.push(RouteName.freeGameScreen) :
                        context.push(RouteName.chooseSubscriptionScreen);
                      }
                    },
                    img: AppImages.primaryUpsidedown,
                  ),
                  SizedBox(height: 40.h),
                  LanguageDropDown(menuKey: menuKey),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, st) => Center(child: Text("Error: $err")),
        ),
      ),
    );
  }
}