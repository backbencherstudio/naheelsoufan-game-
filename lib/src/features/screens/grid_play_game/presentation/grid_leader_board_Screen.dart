import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/customRound_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/leaderBox.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../../data/riverpod/common_disposer.dart';
import '../../game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import '../../main_quiz_screen/presentation/widgets/leaderBoard_widgets/Custom_placeBox.dart';
import '../../main_quiz_screen/presentation/widgets/leaderBoard_widgets/customFisrtPlace.dart';
import '../../main_quiz_screen/presentation/widgets/leaderBoard_widgets/custom_box.dart';
import '../../main_quiz_screen/presentation/widgets/row_arrangment/custom_row.dart';
import '../../main_quiz_screen/presentation/widgets/row_arrangment/custom_rowThree.dart';
import '../../main_quiz_screen/presentation/widgets/row_arrangment/customrowTwo.dart';

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
                          ref.read(commonProviderDisposer)();
                        },
                      );
                    }
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
                                Customfisrtplace(),
                                isPortrait
                                    ? CustomPlacebox(place: 3)
                                    : CustomPlacebox(place: 2),
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
                                  children: [
                                    SizedBox(height: isPortrait ? 20.h : 5.w),
                                    CustomRow(),
                                    SizedBox(height: isPortrait ? 10.h : 4.w),
                                    Customrowtwo(
                                      id: '02',
                                      name: 'Player Name',
                                      scores: '650',
                                      icons: AppImages.award,
                                    ),
                                  ]),
                                ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  width: 17.6.h,
                ),
                CustomroundButton(
                  icon: AppIcons.reload,
                  onTap: () {},
                  bgIcon: AppIcons.roundIcontop,
                ),
              ],
            ),
              if(isPortrait) ...[SizedBox(height: isPortrait ?40.h : 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: isPortrait ? 40.w : 88.h),
                  CustomroundButton(icon: AppIcons.playButtn, onTap: () {}),]
              ),]
            ],
          ),
        ),
      ),
    );
  }
}
