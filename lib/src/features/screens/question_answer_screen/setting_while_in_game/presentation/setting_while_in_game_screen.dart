import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../account_screens/presentation/widgets/custom_music_volume_buttton.dart';
import '../../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../../../game_mode_selection_screens/riverpod/musicVisible_provider.dart';
import '../widgets/centered_button.dart';
import '../widgets/language_drop_down_menu.dart';
import '../widgets/setting_while_game_tile.dart';
import '../widgets/term_text.dart';

final languageProvider = StateProvider<String>((ref) => 'US English');

class SettingWhileInGameScreen extends ConsumerWidget {
  SettingWhileInGameScreen({super.key});

  final _menuKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CreateScreen(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.backSvg,
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                  SizedBox(width: 100.w),
                  LanguageDropDown(menuKey: _menuKey),
                ],
              ),
              SizedBox(height: 36.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer(
                    builder: (context, ref, _) {
                      final isVisible = ref.watch(isMusicVisibleProvider);
                      return CustomMusicoffButton(
                        onTap: () {
                          ref.read(isMusicVisibleProvider.notifier).state = !isVisible;
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    buildSettingsTile(
                      title: 'My Account',
                      leadingIconPath: AppIcons.personSetting,
                      trailingIconPath: AppIcons.forwardIcon,
                      onTap: () {
                        context.push(RouteName.myAccountScreen);
                      },
                    ),
                    SizedBox(height: 13.h),
                    buildSettingsTile(
                      title: 'Leaderboard',
                      leadingIconPath: AppIcons.personShield,
                      trailingIconPath: AppIcons.forwardIcon,
                      onTap: () {
                        context.push(RouteName.leaderboardScreen);
                      },
                    ),
                    SizedBox(height: 13.h),
                    buildSettingsTile(
                      title: 'Settings',
                      leadingIconPath: AppIcons.setting,
                      trailingIconPath: AppIcons.forwardIcon,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 250.h),
              CenteredButton(),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TermsText(text: 'Terms of Use'),
                  SizedBox(width: 8),
                  CircleIndicator(),
                  SizedBox(width: 8),
                  TermsText(text: 'Privacy Policy'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
