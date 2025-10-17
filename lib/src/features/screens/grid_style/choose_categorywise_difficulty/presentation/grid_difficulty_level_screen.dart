// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:naheelsoufan_game/src/core/constant/icons.dart';
// import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
// import 'package:naheelsoufan_game/src/data/dummy/question_types_data.dart';
// import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
// import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
// import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/presentation/widget/custom_grid_question_card.dart';
// import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/platoon_hunter_card.dart';
// import 'package:naheelsoufan_game/src/data/riverpod/function.dart';
// import '../../../../../core/routes/route_name.dart';
// import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
// import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
// import '../../../game_type/riverpod/multiple_choice_provider.dart';
// import '../../choose_multiple_category/riverpod/category_provider.dart';
//
// class GridDifficultyLevelScreen extends StatefulWidget {
//   const GridDifficultyLevelScreen({super.key});
//
//   @override
//   State<GridDifficultyLevelScreen> createState() => _GridDifficultyLevelScreenState();
// }
//
// class _GridDifficultyLevelScreenState extends State<GridDifficultyLevelScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     TextTheme textTheme = Theme.of(context).textTheme;
//
//     return CreateScreen(
//       child: Consumer(
//         builder: (_, ref, _) {
//           debugPrint("\n\n\nPlayer: ${ref.read(playerProvider.notifier).state.currentPlayer}\n\n\n");
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: isPortrait ? 30.h : 13.5.w),
//                 SizedBox(
//                   height: isPortrait ? 300.h : 135.w,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomIconsButtons(
//                         icon: AppIcons.crossIcon,
//                         bgIcon: AppIcons.redButtonBG,
//                         onTap: () {
//                           //onQuitGameTap(context);
//                         },
//                       ),
//                       SizedBox(width: isPortrait ? 8.w : 17.6.h),
//                       Consumer(
//                         builder: (_, ref, _) {
//                           final selectedCategoryList = ref.watch(categoryListProvider);
//                           return Expanded(
//                             child: ListView.separated(
//                               scrollDirection: Axis.horizontal,
//                               padding: EdgeInsets.all(8.r),
//                               itemCount: selectedCategoryList.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Consumer(
//                                   builder: (_, ref, _) {
//                                     return CustomGridQuestionCard(
//                                       questionId:questionList[selectedCategoryList[index]].questionId,
//                                       questionCategory:
//                                           questionList[selectedCategoryList[index]].questionCategory,
//                                       nextScreen: RouteName.questionRevealedScreen,
//                                     );
//                                   }
//                                 );
//                               },
//                               separatorBuilder:
//                                   (_, _) =>
//                                       SizedBox(width: isPortrait ? 4.w : 8.8.h),
//                             ),
//                           );
//                         }
//                       ),
//                       SizedBox(width: isPortrait ? 8.w : 17.6.h),
//                       CustomPopUpMenu()
//                     ],
//                   ),
//                 ),
//                 if (!ref.read(isDifficultyVanished.notifier).state) ...[
//                   SizedBox(height: isPortrait ? 30.h : 13.5.w),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: isPortrait ? 24.w : 52.8.h,
//                       vertical: isPortrait ? 8.h : 3.6.w,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColorScheme.containerColor,
//                       borderRadius: BorderRadius.circular(8.r),
//                       border: Border.all(
//                         width: isPortrait ? 1.w : 2.2.h,
//                         color: AppColorScheme.onPrimary,
//                       ),
//                     ),
//                     child: RichText(
//                       text: TextSpan(
//                         text: "Select difficulty level",
//                         style: textTheme.displayMedium?.copyWith(
//                           fontSize: 7.2.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ] else ...[
//                   SizedBox(height: isPortrait ? 11.h : 3.w),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       PlatoonHunterCard(cardName: "Platoon"),
//                       SizedBox(width: isPortrait ? 24.w : 52.8.h),
//                       PlatoonHunterCard(cardName: "Hunt"),
//                     ],
//                   ),
//                 ],
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
