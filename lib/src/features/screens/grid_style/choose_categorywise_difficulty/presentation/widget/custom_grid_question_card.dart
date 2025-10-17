// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
// import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/custom_difficulty_level_card.dart';
// import '../../../../../../core/routes/route_name.dart';
// import '../../../../../../data/riverpod/function.dart';
// import '../../riverpod/grid_difficulty_provider.dart';
//
// class CustomGridQuestionCard extends ConsumerWidget {
//   final String questionId;
//   final String? questionLevel;
//   final String questionCategory;
//   final Function()? onTap;
//
//   const CustomGridQuestionCard({
//     super.key,
//     required this.questionId,
//     required this.questionLevel,
//     required this.questionCategory,
//     required this.onTap
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final textTheme = Theme.of(context).textTheme;
//     bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//     return GestureDetector(
//       onTap: onTap,
//       child: CustomDifficultyLevelCard(
//         difficulty: "EASY",
//         point: "100",
//         style: textTheme.bodyLarge!.copyWith(color: ref
//             .read(isDifficultyClicked1(int.parse(questionId)).notifier)
//             .state ? AppColorScheme.secondary : AppColorScheme.difficultyTextColor, fontSize: 7.2.sp),
//         backgroundColor: ref
//             .read(isDifficultyClicked1(int.parse(questionId)).notifier)
//             .state ? [
//           AppColorScheme.darkYellow,
//           AppColorScheme.midYellow,
//           AppColorScheme.yellowborder,
//         ] : [
//           AppColorScheme.sweetViolet,
//           AppColorScheme.sweetViolet,
//           AppColorScheme.sweetViolet
//         ],
//         foregroundColor:ref
//             .read(isDifficultyClicked1(int.parse(questionId)).notifier)
//             .state ? [
//           AppColorScheme.yellowborder,
//           AppColorScheme.midYellow,
//           AppColorScheme.darkYellow
//         ] : [
//           AppColorScheme.listContainerColor,
//           AppColorScheme.listContainerColor,
//           AppColorScheme.listContainerColor,
//         ],
//       ),
//     );
//   }
// }