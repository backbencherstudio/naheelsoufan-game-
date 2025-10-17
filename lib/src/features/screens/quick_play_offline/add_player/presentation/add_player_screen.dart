import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/add_player_selection_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/type_player_name_dialog.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';

class AddPlayerScreen extends ConsumerStatefulWidget {
  const AddPlayerScreen({super.key});

  @override
  ConsumerState<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends ConsumerState<AddPlayerScreen> {
  late TextEditingController _textController;
  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    final player = ref.watch(playerNameProvider);
    final playerNameList = player.playerNames;

    final selectionState = ref.watch(addPlayerTileSelection);

    final isMaxPlayer = playerNameList.length >= 8;
    final isMinPlayer = playerNameList.length <= 2;

    return CreateScreen(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Consumer(
            builder: (context, ref, _) {

              return Column(
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
                    itemCount: playerNameList.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: AddSelectionTile(
                          index: index,
                          playerName: playerNameList[index],
                          onTap: () {
                              ref.read(addPlayerTileSelection.notifier).state = index;
                              showNameDialog(context, ref, _textController, index);
                          },
                          onTabRemove: () {
                            if(!isMinPlayer) {
                              ref.read(playerNameProvider.notifier).removePlayerAt(index);
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("At 2 Player needed to play this game"),
                                    backgroundColor: AppColorScheme.error,
                                  )
                              );
                            }
                            debugPrint(playerNameList.toString());
                          }
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40.h),

                  if (isMaxPlayer)
                    ...[Container(
                      width: 300.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColorScheme.borderColor),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 10.h,
                        ),
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
                    )]
                  else
                    ...[Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if(!isMinPlayer) {
                              ref.read(playerNameProvider.notifier).removeLastPlayer();
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("At 2 Player needed to play this game"),
                                  backgroundColor: AppColorScheme.error,
                                )
                              );
                            }
                            debugPrint(playerNameList.toString());
                          },
                          child: Opacity(
                            opacity:
                                !isMinPlayer
                                    ? 1
                                    : 0.4,
                            child: SvgPicture.asset(AppIcons.minusBtn),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Text('Add Player'),
                        SizedBox(width: 25.w),
                        GestureDetector(
                          onTap: () {
                            ref.read(playerNameProvider.notifier).addPlayer("player ${playerNameList.length + 1}");
                            debugPrint(playerNameList.toString());
                          },
                          child: SvgPicture.asset(AppIcons.plusBtn),
                        ),
                      ],
                    )],

                  SizedBox(height: 20.h),

                  GestureDetector(
                    onTap: () {
                      context.pushReplacement(RouteName.categorySelectionScreen);
                    },
                    child: Container(
                      width: 229.w,
                      decoration: BoxDecoration(
                        color: AppColorScheme.onSurface,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border(
                          left: BorderSide(
                            color: AppColorScheme.softGradGreen,
                            width: 0.5.w,
                          ),
                          right: BorderSide(
                            color: AppColorScheme.softGradGreen,
                            width: 0.5.w,
                          ),
                          bottom: BorderSide(
                            color: AppColorScheme.softGradGreen,
                            width: 1.5.w,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColorScheme.softGradGreen.withOpacity(
                              0.3,
                            ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
