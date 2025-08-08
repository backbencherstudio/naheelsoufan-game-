import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/special_elevated_button003/special_elevated_button003.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/customRound_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/custom_question_type_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/grid_choose_category_question_tile.dart';

import '../riverpod/function.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({super.key});

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
                    context.pop();
                  },
                ),
                Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                CustomPopUpMenu(),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "player 1",
              style: style.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColorScheme.primary,
              ),
            ),
            SizedBox(height: 36.h),

            Consumer(
              builder: (_, ref, _) {
                final pageController = ref.watch(pageControllerProvider);
                return Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int pageIndex) {
                      return Consumer(
                        builder: (_, ref, _) {
                          final pageIndex = ref.watch(pageIndexProvider);
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 30,
                              childAspectRatio: (0.5),
                            ),
                            itemCount: pageIndex == 0 ? 9 : 6,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GridChooseCategoryQuestionTile(
                                      onTap: () {
                                        ref.read(isSelectedClicked(index).notifier).state = !(ref.read(isSelectedClicked(index).notifier).state);
                                        ref.read(isSomethingClicked.notifier).state = true;
                                      }, index: index,

                                  ),
                                  Text(
                                    "General\nKnowledge",
                                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColorScheme.primary
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      );
                    }
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Consumer(
              builder: (_, ref, _) {
                final checkButton = ref.watch(isSomethingClicked);
                final pageController = ref.watch(pageControllerProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomroundButton(
                      icon: AppIcons.playleft,
                      onTap:()=>ref
                          .read(pageIndexProvider.notifier).previousPage(pageController),
                      bgIcon: AppIcons.roundIcontop,
                    ),
                    if(!ref.read(isSomethingClicked.notifier).state) ...[SizedBox(width: 40.w)] else ...[SizedBox(width: 26.w,),SpecialElevatedButton003(onTap: (){
                      context.pushReplacement(RouteName.gridDifficultyLevelScreen);
                    }, buttonName: "NEXT"),SizedBox(width: 26.w,)] ,
                    CustomroundButton(icon: AppIcons.playButtn, onTap:()=>ref
                        .read(pageIndexProvider.notifier).nextPage(pageController, 2)
                    ),
                  ],
                );
              }
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
