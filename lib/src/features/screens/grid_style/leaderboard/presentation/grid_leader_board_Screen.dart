import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import '../../../../common_widegts/custom_round_button/customRound_button.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../quick_play_offline/leaderboard/presentation/widget/custom_box.dart';
import '../../../quick_play_offline/leaderboard/presentation/widget/custom_first_place.dart';
import '../../../quick_play_offline/leaderboard/presentation/widget/custom_place_box.dart';
import '../../../quick_play_offline/leaderboard/presentation/widget/custom_row.dart';

class GridLeaderBoardScreen extends StatefulWidget {
  const GridLeaderBoardScreen({super.key});

  @override
  State<GridLeaderBoardScreen> createState() => _GridLeaderBoardScreenState();
}

class _GridLeaderBoardScreenState extends State<GridLeaderBoardScreen> {
  @override
  void initState() {
    super.initState();
    _setLandscapeMode(); // Set orientation to landscape
  }

  @override
  void dispose() {
    _setPortraitMode(); // Reset orientation to portrait
    super.dispose();
  }

  // Force landscape mode
  void _setLandscapeMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  //Reset to portrait mode
  void _setPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final style = Theme.of(context).textTheme;

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(
                    builder: (_, ref, _) {
                      return CustomIconsButtons(
                        icon: AppIcons.backIcons,
                        onTap: () {
                          context.go(RouteName.gameModeScreens);
                        },
                      );
                    },
                  ),

                  Text(
                    "Congratulation “Team Name”",
                    textAlign: TextAlign.center,
                    style: style.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomPopUpMenu(),
                ],
              ),

              SizedBox(height: isPortrait ? 20.h : 5.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainerBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3D4279).withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: isPortrait ? 20.w : 500.h,
                              right: isPortrait ? 20.w : 500.h,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  isPortrait
                                      ? MainAxisAlignment.spaceBetween
                                      : MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomFirstPlace(name: 'Chini', scores: 100),
                                isPortrait
                                    ? CustomPlaceBox(
                                      place: 3,
                                      name: 'Chini3',
                                      scores: 25,
                                    )
                                    : CustomPlaceBox(
                                      place: 2,
                                      name: 'Chini2',
                                      scores: 50,
                                    ),
                              ],
                            ),
                          ),
                          SizedBox(height: isPortrait ? 10.h : 4.w),
                          Padding(
                            padding: EdgeInsets.only(
                              left: isPortrait ? 20.w : 44.h,
                              right: isPortrait ? 20.w : 44.h,
                              bottom: isPortrait ? 30.h : 13.5.w,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Column(
                                children: List.generate(4, (index) {
                                  return CustomRow(
                                    name: "CHINI",
                                    scores: 150,
                                    right: 2,
                                    wrong: 1,
                                    skip: 5,
                                    index: index + 1,
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 17.6.h),
                  CustomroundButton(
                    icon: AppIcons.reload,
                    onTap: () {},
                    bgIcon: AppIcons.roundIcontop,
                  ),
                ],
              ),
              if (isPortrait) ...[
                SizedBox(height: isPortrait ? 40.h : 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: isPortrait ? 40.w : 88.h),
                    CustomroundButton(icon: AppIcons.playButtn, onTap: () {}),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
