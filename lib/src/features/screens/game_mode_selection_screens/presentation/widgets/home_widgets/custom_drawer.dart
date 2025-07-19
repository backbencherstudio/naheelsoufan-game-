import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_MusicOff_Button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_language_container.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_list_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_logout_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/musicVisible_provider.dart';

Drawer appDrawer({required BuildContext context}) {
  final Map<String, dynamic> map = {
    "My account": AppIcons.personSetting,
    "Setting": AppIcons.setting,
    "Leaderboard": AppIcons.personShield,
    "How to play": AppIcons.tvQuestion,
    "How to play video": AppIcons.youtubeIcon,
  };
        final style = Theme.of(context).textTheme;

  return Drawer(
    backgroundColor: AppColorScheme.deepPuroleBG,
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                CustomLanguageContainer(),
                Spacer(),
                CustomIconsButtons(
                  icon: AppIcons.crossIcon,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  bgIcon: AppIcons.redBGsqare,
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final isVisible = ref.watch(isMusicVisibleProvider);
                    return CustomMusicoffButton(
                      onTap: () {
                        ref.read(isMusicVisibleProvider.notifier).state =
                            !isVisible;
                      },
                      isSelected: isVisible,
                    );
                  },
                ),
                SizedBox(width: 10.w),
                CustomIconsButtons(
                  icon: AppIcons.sound,
                  onTap: () {},
                  bgIcon: AppIcons.iconBG,
                ),
              ],
            ),

            SizedBox(height: 40.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: map.length,
              itemBuilder: (BuildContext context, int index) {
                var data = map.entries.elementAt(index);
                return Padding(
                  padding: EdgeInsets.only(bottom: 13.h),
                  child: CustomListTile(title: data.key, icon: data.value),
                );
              },
            ),
            SizedBox(height: 40.h),
            CustomLogoutButton(onTap: () {}),
                            SizedBox(height: 40.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Terms of Use",
                style: style.bodyLarge!.copyWith(
                  color: AppColorScheme.newText
                )
                ),
                SizedBox(width: 8.w,),
                 SvgPicture.asset(AppIcons.tinydot),
                SizedBox(width: 8.w,),
                Text("Privacy Policy",
                 style: style.bodyLarge!.copyWith(
                  color: AppColorScheme.newText
                )
                ),

              ],

            ),
                SizedBox(height: 16.h,),
                Text("Question & Answers",
                 style: style.bodyLarge!.copyWith(
                  color: AppColorScheme.newText
                )
                ),

          ],
        ),
      ),
    ),
  );
}
