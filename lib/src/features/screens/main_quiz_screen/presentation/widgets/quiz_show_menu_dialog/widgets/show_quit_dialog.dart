import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/riverpod/multiple_choice_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/quit_game_button_header.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/routes/route_name.dart';
import '../../../../../../../data/riverpod/common_disposer.dart';
import '../../../riverpod/stateProvider.dart';

void onQuitGameTap(BuildContext context) {
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
                          // final controller = ref.read(playerProvider.notifier);
                          // final current = ref.read(playerProvider);
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              context.go(RouteName.gameModeScreens);
                              // controller.state = current.copyWith(currentPlayer: 0);
                              // controller.state = current.copyWith(totalPlayer: 2);
                              // controller.state = current.copyWith(stealPlayer: -1);
                              for (final i in [0, 1, 2, 3]) {
                                ref.read(checkChoicesProvider(i).notifier).state = -1;
                              }
                              ref.read(commonProviderDisposer)();
                              ref.read(isClose.notifier).state = true;
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
