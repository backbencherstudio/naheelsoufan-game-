import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/riverpod/grid_difficulty_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_multiple_category/riverpod/category_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/riverpod/multiple_choice_provider.dart';
import 'package:naheelsoufan_game/src/data/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/quit_game_button_header.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../data/repository/subscription/subscription_service.dart';
import '../../../../../../data/riverpod/player_game/player_game_controller.dart';
import '../../../../../../data/riverpod/subscription/subscription_controller.dart';
import '../../../../game_mode_selection_screens/riverpod/player_provider.dart';

void onQuitGameTap(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (_) {
      bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 1,
        child: SizedBox(
          height: isPortrait ? 360.h : 90.w,
          width: isPortrait ? null: 860.h,
          child: Stack(
            children: [
              Positioned.fill(
                top: isPortrait ? 26.w : 57.2.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: isPortrait ? 24.w : 52.8.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFB4AB), width: isPortrait ? 3.w : 6.6.h),
                    color: Color(0xffFFDAD6),
                    borderRadius: BorderRadius.circular(isPortrait ? 24.r : 40.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: isPortrait ? 0 : 10.w,),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Are you sure you want to Quit the game?',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff93000A),
                            fontSize: isPortrait ? 28.sp : 9.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: isPortrait ? 40.h: 10.w),
                      Consumer(
                        builder: (_, ref, _) {
                          return GestureDetector(
                            onTap: () async {
                              ref.read(userSubscriptionDataProvider.notifier).state = await SubscriptionService().fetchUserSubscription();
                              ref.read(playerGameProvider.notifier).fetchGames();

                              ref.invalidate(playerProvider);
                              ref.invalidate(isQuestionVanished);
                              ref.invalidate(isQuestionVanishTeam2);
                              ref.invalidate(isQuestionVanishTeam1);
                              ref.invalidate(categoryListProvider);
                              ref.invalidate(isCategorySelectedClicked);
                              ref.invalidate(isSomethingClicked);
                              for (final i in [0, 1, 2, 3]) {
                                ref.read(checkChoicesProvider(i).notifier).state = -1;
                              }
                              ref.read(isClose.notifier).state = true;


                              context.go(RouteName.gameModeScreens);
                            },
                            child: HeaderButton(
                              textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontSize: isPortrait ? 22.sp: 9.sp
                              ),
                              textTitle: 'Yes, Quit',
                              gradientColor: LinearGradient(
                                colors: [Color(0xffF80715), Color(0xffA80710)],
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: isPortrait ? 60.w : 80.h,
                                vertical: isPortrait ? 16.h : 6.w,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),

              QuitGameButtonHeader(),

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(
                    child: SvgPicture.asset(AppIcons.cancelSvg),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
