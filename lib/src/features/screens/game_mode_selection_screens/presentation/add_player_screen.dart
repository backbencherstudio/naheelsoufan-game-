import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/model/player/player_model.dart';
import 'package:naheelsoufan_game/src/data/riverpod/game/start_game/start_game_provider.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/add_player_widgets/add_player_selection_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/add_player_widgets/type_player_name_dialog.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';
import '../../../../data/repository/game/game_mode/select_game_mode_service.dart';
import '../../../../data/repository/player/select_player_service.dart';
import '../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../riverpod/mode_controller.dart';
import '../riverpod/player_name_provider.dart';

class AddPlayerScreen extends ConsumerWidget {
  const AddPlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final state = ref.watch(selectionProvider);
    final notifier = ref.read(selectionProvider.notifier);
    final fixedPlayers = {0: true, 1: true};
    final dynamicPlayerKeys = [2, 3];
    final dynamicPlayers = state.selectedTiles;
    final allPlayers = {...fixedPlayers, ...dynamicPlayers};
    final keys = allPlayers.keys.toList()..sort();
    final totalPlayers = allPlayers.length;
    final isMaxPlayers = totalPlayers >= 4;
    final controller = ref.read(playerProvider.notifier);
    final current = ref.read(playerProvider);
    final names = ref.watch(playerNamesProvider);

    final mode = ref.watch(modeProvider);
    debugPrint('Player names: $names');

    return CreateScreen(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Column(
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconsButtons(
                    icon: AppIcons.backIcons,
                    onTap: () => Navigator.pop(context),
                  ),
                  Image.asset(
                    AppImages.profilePic,
                    height: 40.h,
                    width: 40.w,
                  ),
                  CustomPopUpMenu(),
                ],
              ),
              SizedBox(height: 140.h),

              // Title
              Text(
                "Add Players",
                style: style.headlineLarge!.copyWith(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColorScheme.primary,
                ),
              ),
              SizedBox(height: 24.h),

              // Player Tiles
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  final key = keys[index];
                  final isSelected = allPlayers[key] ?? false;

                  String playerName = "";
                  switch (key + 1) {
                    case 1:
                      playerName = ref.watch(playerProvider1);
                      break;
                    case 2:
                      playerName = ref.watch(playerProvider2);
                      break;
                    case 3:
                      playerName = ref.watch(playerProvider3);
                      break;
                    case 4:
                      playerName = ref.watch(playerProvider4);
                      break;
                  }

                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: AddSelectionTile(
                      index: '${key + 1}',
                      playerName: playerName.isNotEmpty ? playerName : "Player ${key + 1}",
                      isSelected: isSelected,
                      onTap: () {
                        showNameDialog(context, ref, key + 1);
                      },
                      onTabRemove: dynamicPlayerKeys.contains(key)
                          ? () {
                        final updated = Map<int, bool>.from(state.selectedTiles)..remove(key);
                        notifier.state = state.copyWith(selectedTiles: updated);
                        // Reset name for removed player
                        switch (key + 1) {
                          case 3:
                            ref.read(playerProvider3.notifier).state = "";
                            break;
                          case 4:
                            ref.read(playerProvider4.notifier).state = "";
                            break;
                        }
                      }
                          : null,
                    ),
                  );
                },
              ),

              SizedBox(height: 40.h),

              if (isMaxPlayers)
                Container(
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColorScheme.borderColor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "You've added maximum player!\nSubscribe to add more players.",
                        textAlign: TextAlign.center,
                        style: style.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),

              SizedBox(height: 12.h),

              if (!isMaxPlayers)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        final removable = state.selectedTiles.keys
                            .where((k) => dynamicPlayerKeys.contains(k))
                            .toList()
                          ..sort();
                        if (removable.isNotEmpty) {
                          final lastKey = removable.last;
                          final updated = Map<int, bool>.from(state.selectedTiles)..remove(lastKey);
                          notifier.state = state.copyWith(selectedTiles: updated);
                          // Reset name for removed player
                          switch (lastKey + 1) {
                            case 3:
                              ref.read(playerProvider3.notifier).state = "";
                              break;
                            case 4:
                              ref.read(playerProvider4.notifier).state = "";
                              break;
                          }
                        }
                      },
                      child: Opacity(
                        opacity: state.selectedTiles.keys.any((k) => dynamicPlayerKeys.contains(k)) ? 1 : 0.4,
                        child: SvgPicture.asset(AppIcons.minusBtn),
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Text('Add Player'),
                    SizedBox(width: 25.w),
                    GestureDetector(
                      onTap: () {
                        if (totalPlayers < 4) {
                          for (final key in dynamicPlayerKeys) {
                            if (!state.selectedTiles.containsKey(key)) {
                              final updated = Map<int, bool>.from(state.selectedTiles)..[key] = true;
                              notifier.state = state.copyWith(selectedTiles: updated);
                              break;
                            }
                          }
                        }
                      },
                      child: Opacity(
                        opacity: totalPlayers < 4 ? 1 : 0.4,
                        child: SvgPicture.asset(AppIcons.plusBtn),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 20.h),

              GestureDetector(
                onTap: () async {
                  controller.state = current.copyWith(totalPlayer: totalPlayers);
                  final playerNames = ref.read(playerNamesProvider);
                  if (playerNames.length < 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please add at least 2 players")),
                    );
                    return;
                  }
                  final selectPlayers = SelectPlayersService();
                  final result = await selectPlayers.selectPlayers(context: context, players: playerNames);
                  if (result?.success == true) {
                    ref.read(playerListProvider.notifier).state = result;
                    context.pushReplacement(
                      RouteName.catagorySelectionScreen,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result?.message ?? "Player added successful", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result?.message ?? "Something went wrong", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                    );
                  }
                },
                child: Container(
                  width: 229.w,
                  decoration: BoxDecoration(
                    color: AppColorScheme.onSurface,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border(
                      left: BorderSide(color: AppColorScheme.softGradGreen, width: 0.5.w),
                      right: BorderSide(color: AppColorScheme.softGradGreen, width: 0.5.w),
                      bottom: BorderSide(color: AppColorScheme.softGradGreen, width: 1.5.w),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColorScheme.softGradGreen.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text(
                        "Start",
                        style: style.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}