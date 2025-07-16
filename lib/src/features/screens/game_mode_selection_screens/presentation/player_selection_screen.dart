import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/player_selection_widgets/selection_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';

class PlayerSelectionScreen extends StatelessWidget {
  const PlayerSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Consumer(
          builder: (context, ref, _) {
            final isSelected = ref.watch(selectionProvider);
            final areAllSelected = ref
                .read(selectionProvider.notifier)
                .areAllTilesSelected(4);
            return Column(
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
                    CustomIconsButtons(icon: AppIcons.settings, onTap: () {}),
                  ],
                ),
                SizedBox(height: 140.h),
                Text(
                  "Waiting for Players",
                  style: style.headlineLarge!.copyWith(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffE0E0FF),
                  ),
                ),
                SizedBox(height: 24.h),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final bool isTileSelected =
                        isSelected.selectedTiles[index] ?? false;

                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: SelectionTile(
                        index: '${index + 1}',
                        onTap: () {
                          ref
                              .read(selectionProvider.notifier)
                              .toggleTileSelection(index);
                        },
                        iselected: isTileSelected,
                      ),
                    );
                  },
                ),

                SizedBox(height: 70.h),
                if (areAllSelected == true) ...[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Color(0xffE0E0FF)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Text(
                        "All players joined. You can start now!",
                        style: style.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffE0E0FF),
                        ),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 229.w,
                    decoration: BoxDecoration(
                      color: Color(0xff008A39),
                      borderRadius: BorderRadius.circular(8.r),

                      border: Border(
                        left: BorderSide(color: Color(0xffB8F1B9), width: 1.0),
                        right: BorderSide(color: Color(0xffB8F1B9), width: 1.0),
                        bottom: BorderSide(color: Color(0xffB8F1B9), width: 1.0),
                        top: BorderSide.none,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:  Color(0xffB8F1B9).withValues(alpha: 0.3),
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
                            color: Color(0xffffffff),
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
    );
  }
}
