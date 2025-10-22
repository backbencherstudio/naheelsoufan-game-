import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/data/riverpod/loading.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/mode_selection_widgets/custom_card.dart';
import '../../../../data/repository/game/game_mode/select_game_mode_service.dart';
import '../../../../data/repository/subscription/subscription_service.dart';
import '../../../../data/riverpod/player_game/player_game_controller.dart';
import '../../../../data/riverpod/subscription/subscription_controller.dart';
import '../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import '../../setting/widgets/language_drop_down_menu.dart';
import '../riverpod/mode_controller.dart';

class ModeSelectionScreen extends ConsumerStatefulWidget {
  const ModeSelectionScreen({super.key});

  @override
  ConsumerState<ModeSelectionScreen> createState() => _ModeSelectionScreenState();
}

class _ModeSelectionScreenState extends ConsumerState<ModeSelectionScreen> {

  @override
  void initState() {
    Future.microtask(() async {
      ref.read(isLoading.notifier).state = true;
      ref.read(userSubscriptionDataProvider.notifier).state = await SubscriptionService().fetchUserSubscription();
      ref.read(playerGameProvider.notifier).fetchGames();
      ref.read(isLoading.notifier).state = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final _menuKey = GlobalKey();
    final userSubscriptionData = ref.watch(userSubscriptionDataProvider);
    final userGameData = ref.watch(playerGameProvider);
    final loading = ref.watch(isLoading);
    final mode = ref.watch(modeProvider);
    return CreateScreen(
      keys: keys,

      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: loading ? SizedBox(height: 200.w,child: Center(child: const CircularProgressIndicator(color: Colors.green,))) : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconsButtons(
                    icon: AppIcons.cubeIcons,
                    onTap: () {
                      debugPrint("Drawer Tapped");
                      if (keys.currentState != null) {
                        keys.currentState?.openDrawer();
                      } else {
                        debugPrint("Scaffold keys is null");
                      }
                    },
                  ),
                  Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                  CustomPopUpMenu()
                ],
              ),
              SizedBox(height: 28.h),
              Image.asset(AppImages.logo, height: 52.h, width: 150.w),
              SizedBox(height: 26.h),
              CustomCard(
                img: AppImages.playoffline,
                text: 'PLAY OFFLINE',
                onTap: () async {
                  ref.read(modeProvider.notifier).state = 1;
                  debugPrint(userSubscriptionData?.data.toString());

                  if(userSubscriptionData?.data != null) {
                    final selectGameMode = SelectGameModeService();
                    final result = await selectGameMode.createGame(
                      context: context,
                      gameMode: mode,
                    );

                    (result == true) ? debugPrint("Game Created Successfully") : debugPrint("Game Creation Unsuccessful");
                  }

                  (userGameData?.data.summary.quickGamesCreated == 0) ?
                  context.push(RouteName.freeGameScreen) : (userSubscriptionData?.data == null) ?
                  context.push(RouteName.chooseSubscriptionScreen) : context.push(RouteName.addPlayerScreen);
                },
              ),
              SizedBox(height: 20.h),
              Consumer(
                builder: (context, ref, _) {
                  final userGameData = ref.watch(playerGameProvider);
                  return CustomCard(
                    img: AppImages.card,
                    text: 'CREATE ROOM',
                    secondaryImg: AppImages.primaryUpsidedown,
                    onTap: () {

                      /// CREATE MULTI PLAYER GAME

                      ref.read(modeProvider.notifier).state = 2;
                      (userGameData?.data.summary.quickGamesCreated == 0) ?
                      context.push(RouteName.freeGameScreen) :
                      (userSubscriptionData?.data == null) ?
                      context.push(RouteName.chooseSubscriptionScreen) : context.push(RouteName.enterTeamNameScreen);
                    },
                  );
                },
              ),
              SizedBox(height: 16.h),
              LanguageDropDown(menuKey: _menuKey),
            ],
          ),
        ),
      ),
    );
  }
}