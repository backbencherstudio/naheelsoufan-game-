import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_countdown.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_wrong_countdown.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/primary_button.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/routes/route_name.dart';
import '../../../../../../../data/riverpod/count_down_state.dart';
import '../../../riverpod/advance_turn_controller.dart';
import '../../../riverpod/stateProvider.dart';

void onWrongAnswerTap(BuildContext context, ref) {
  bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  // ref.listen<AdvanceNavigation>(advanceNavigationProvider, (prev, next) {
  //   if (next == AdvanceNavigation.leaderboard) {
  //     context.push(RouteName.leaderboardScreen);
  //   } else if (next == AdvanceNavigation.nextTurn) {
  //     context.push(RouteName.nextTurnScreen);
  //   }
  //   ref
  //       .read(advanceNavigationProvider.notifier)
  //       .state =
  //       AdvanceNavigation.none;
  // });
  // ref.watch(advanceTurnControllerProvider);
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   ref.read(autoCounterProvider(5).notifier).start();
  // });
  showDialog(
    context: context,
    builder: (_) {
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
                        child: HeaderButton(
                          height: isPortrait ? null : 25.w,
                          textTitle: 'Chance to steal the point',
                          borderColor: Color(0xffFFB4AB),
                          borderWidth: 3.w,
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
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: ClipOval(child: SvgPicture.asset(AppIcons.cancelSvg)),
                ),
              ),

              Positioned(
                top: 0,
                child: CustomWrongCountdown(onCompleted: (){
                  context.pop();
                })
              ),
            ],
          ),
        ),
      );
    },
  );
}
