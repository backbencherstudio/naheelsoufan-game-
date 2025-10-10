import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/free_game_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/free_game_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/see_plans_container.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/freeExpire_provider.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';

class FreeGameScreen extends StatelessWidget {
  const FreeGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
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
                  CustomIconsButtons(icon: AppIcons.settings, onTap: () {
                    context.push(RouteName.clickedSettingScreen);
                  }),
                ],
              ),
          
              SizedBox(height: 40.h),
              FreeGametile(),
              SizedBox(height: 121.h),
              Consumer(
                builder: (_, ref, _) {
                  final checkScreen = ref.watch(checkNormalGridScreen);
                  return FreeGameCard(
                    onTap: () {
                      //choosePaymentCard
                      ref.read(isFreeModeOnProvider.notifier).state = true;
                      ref.read(checkGridSubscription.notifier).state = true;
                      (ref.read(checkNormalGridScreen.notifier).state)
                          ? context.push(RouteName.createRoomScreen)
                          : context.push(RouteName.enterTeamNameScreen);
                    },
                  );
                },
              ),
              SizedBox(height: 121.h),
              //Spacer(),
              InkWell(
                  child: SeePlansContainer(),
                  onTap: ()=> context.push(RouteName.chooseSubscriptionScreen),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
