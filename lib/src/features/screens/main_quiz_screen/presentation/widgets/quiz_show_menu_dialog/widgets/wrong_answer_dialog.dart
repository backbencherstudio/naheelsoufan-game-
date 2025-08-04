import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/riverpod/multiple_choice_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/primary_button.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/routes/route_name.dart';
import '../../../../../question_answer_screen/next_turn/riverpod/player_name_state_provider.dart';
import '../../../riverpod/stateProvider.dart';

void onWrongAnswerTap(BuildContext context) {
  bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  showDialog(
    context: context,
    builder: (_) {
      List<int> listID = [0, 1, 2, 3, 4];
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 1,
        child: SizedBox(
          height: isPortrait ? 791.h : 355.w,
          child: Stack(
            children: [
              Positioned(
                top: isPortrait ? 142.h : 10.w,
                left: isPortrait ? null : 300.h,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isPortrait ? 410.h : 150.5.w,
                    maxWidth: isPortrait ? 330.w : 1000.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: isPortrait ? 24.w : 52.8.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFB4AB), width: 3),
                    color: Color(0xffFFDAD6),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: isPortrait ? 40.h : 22.w),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Wrong Answer',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff93000A),
                            fontSize: isPortrait ? 28.sp : 12.6.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: isPortrait ? 44.h : 10.w),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isPortrait ? 16.w : 35.2.h,
                            vertical: isPortrait ? 12.h : 0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff009940),
                              width: 1,
                            ),
                            color: Color(0xffEBFFE7),
                            borderRadius: BorderRadius.circular(
                              isPortrait ? 24.r : 52.r,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Correct Answer is',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.copyWith(
                                  color: Color(0xff009940),
                                  fontWeight: FontWeight.w500,
                                  fontSize: isPortrait ? 16.sp : 7.2.sp,
                                ),
                              ),
                              SizedBox(height: isPortrait ? 12.w : 26.4.h),
                              PrimaryButton(
                                text: 'China',
                                isSelected: true,
                                onTap: () {},
                                width: isPortrait ? 166.w : 365.h,
                                height: isPortrait ? 53.h : 23.w,
                                color: Colors.white,
                                textSize: isPortrait ? 16.sp : 8.sp,
                              ),
                              SizedBox(height: isPortrait ? 16.w : 35.2.h),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: isPortrait ? 44.h : 10.w),
                      Expanded(
                        child: Consumer(
                          builder: (_, ref, _) {
                            return HeaderButton(
                              onClick: () {
                                ref.read(resetVersionProvider.notifier).state++;
                                ref.read(selectedPlayerIndexProvider.notifier).state = -1;
                                ref.read(isCorrectQuiz.notifier).state = true;
                                ref.read(huntModeOn.notifier).state = true;
                                for (final id in listID) {
                                  ref.read(checkChoicesProvider2(id).notifier).state = -1;
                                }
                                Navigator.pop(context);
                              },
                              height: isPortrait ? null : 25.w,
                              textTitle: 'Chance to steal the point',
                              borderColor: Color(0xffFFB4AB),
                              borderWidth: 3,
                              borderRadius: BorderRadius.circular(
                                isPortrait ? 8.r : 20.r,
                              ),
                              textStyle: Theme.of(
                                context,
                              ).textTheme.titleSmall?.copyWith(
                                color: Color(0xffFFDAD6),
                                fontWeight: FontWeight.w500,
                                fontSize: isPortrait ? 20.sp : 10.sp,
                              ),

                              gradientColor: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFFF5449),
                                  Color(0xFFFF5449),
                                  Color(0xFFFF5449),
                                ],
                                stops: [0.0, 0.4904, 1.0],
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: isPortrait ? 12.w : 26.4.h,
                                vertical: isPortrait ? 8.h : 3.6.w,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: isPortrait ? 40.h : 18.w),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: isPortrait ? 110.h : -0.5.w,
                left: isPortrait ? 130.w : 750.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.circleSgv),
                    Positioned(child: SvgPicture.asset(AppIcons.wrong)),
                  ],
                ),
              ),

              Positioned(
                top: isPortrait ? 115.h : 0,
                right: isPortrait ? 10 : 280.h,
                child: Consumer(
                  builder: (_, ref, _) {
                    final current = ref.read(playerProvider);
                    final List players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];
                    return GestureDetector(
                      onTap: () {
                        int currentPlayerTurn = ref.read(playerTurnProvider);

                        int nextPlayerTurn = (currentPlayerTurn + 1) % current.totalPlayer;
                        ref.read(playerTurnProvider.notifier).state =
                            nextPlayerTurn;

                        ref.read(playerNameProvider.notifier).state = players[nextPlayerTurn];

                        if (nextPlayerTurn == 0) {
                          context.push(RouteName.leaderboardScreen);
                        } else {
                          ref.read(resetVersionProvider.notifier).state++;
                          context.push(RouteName.nextTurnScreen);
                        }
                      },
                      child: ClipOval(child: SvgPicture.asset(AppIcons.cancelSvg)),
                    );
                  }
                ),
              ),

              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.circleSgv,
                        width: isPortrait ? 36.w : 79.h,
                        height: isPortrait ? 36.h : 16.2.w,
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.all(2.r),
                          child: Text(
                            '5',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: Color(0xffBA1A1A),
                              fontWeight: FontWeight.w500,
                              fontSize: isPortrait ? 20.sp : 9.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
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
