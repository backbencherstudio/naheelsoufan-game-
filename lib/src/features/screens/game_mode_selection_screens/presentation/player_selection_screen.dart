import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/player_selection_widgets/selection_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';

class PlayerSelectionScreen extends ConsumerWidget {
  const PlayerSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final isSelected = ref.watch(selectionProvider);
    final areAllSelected = ref.watch(selectionProvider.notifier).areAllTilesSelected(4);

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Image.asset(
                  AppImages.profilePic,
                  height: 40.h,
                  width: 40.w,
                ),
                CustomIconsButtons(icon: AppIcons.threeDotSvg, onTap: () {}),
              ],
            ),
            SizedBox(height: 140.h),
            Text(
              "Waiting for Players",
              style: style.headlineLarge!.copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: AppColorScheme.primary,
              ),
            ),
            SizedBox(height: 24.h),

            // List of player selection tiles
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                final bool isTileSelected = isSelected.selectedTiles[index] ?? false;

                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: SelectionTile(
                    index: '${index + 1}',
                    onTap: () {
                      ref.read(selectionProvider.notifier).toggleTileSelection(index);
                    },
                    isSelected: isTileSelected,
                  ),
                );
              },
            ),

            SizedBox(height: 70.h),

            // Display "All players joined" message when all players are selected
            if (areAllSelected) ...[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColorScheme.borderColor),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Text(
                    "All players joined. You can start now!",
                    style: style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
            SizedBox(height: 20.h),

            // Start button, navigates to the next screen when pressed
            GestureDetector(
              onTap: () {
                context.push(RouteName.categorySelectionScreen);
              },
              child: Container(
                width: 229.w,
                decoration: BoxDecoration(
                  color: Color(0xff008A39),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border(
                    left: BorderSide(color: AppColorScheme.softGradGreen, width: 0.5.w),
                    right: BorderSide(color: AppColorScheme.softGradGreen, width: 0.5.w),
                    bottom: BorderSide(color: AppColorScheme.softGradGreen, width: 1.5.w),
                    top: BorderSide.none,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColorScheme.softGradGreen.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 0),
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
    );
  }
}
