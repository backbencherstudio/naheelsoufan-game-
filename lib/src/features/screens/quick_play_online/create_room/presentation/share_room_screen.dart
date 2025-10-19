import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/create_room_widgets/custom_header_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/share_room%20widgets/qr_box.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/share_room%20widgets/room_link_box.dart';
import '../../../../../core/constant/images.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';

class ShareRoomScreen extends StatelessWidget {
  const ShareRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

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
                Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                CustomPopUpMenu(),
              ],
            ),
            SizedBox(height: 20.h),

            Text(
              "Share Room",
              style: style.headlineLarge!.copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: AppColorScheme.primary,
              ),
            ),
            SizedBox(height: 14.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColorScheme.borderColor),
              ),
              child: Column(
                children: [
                  CustomHeaderTile(),
                  SizedBox(height: 24.h),
                  Text(
                    "Room Link",
                    style: style.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  RoomLinkBox(),
                  SizedBox(height: 24.h),
                  Text(
                    "QR Code",
                    style: style.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  QrBox(),
                  SizedBox(height: 60.h),
                  Consumer(
                    builder: (context, ref, _) {
                      return CustomButton(
                        text: "NEXT",
                        img: AppImages.primaryUpsidedown,
                        onTap: () {
                          /// NEED TO WORK
                        },
                      );
                    },
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
