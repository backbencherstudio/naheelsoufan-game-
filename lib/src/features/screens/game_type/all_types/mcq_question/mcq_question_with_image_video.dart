import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/widget/video_part.dart';

import '../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../grid_play_game/riverpod/function.dart';
import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
import '../../riverpod/multiple_choice_provider.dart';
import '../../widgets/full_screen_image_popup.dart';
import 'widget/image_part.dart';

class McqQuestionWithImageVideo extends StatelessWidget {
  final List<String> choices;
  final String question;
  final String? imageUrl;
  final String? videoUrl;
  final String? videoThumbnailUrl;
  final int? rightIndex;
  const McqQuestionWithImageVideo({
    super.key,
    required this.choices,
    required this.question,
    this.imageUrl,
    this.videoUrl,
    this.videoThumbnailUrl,
    this.rightIndex
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      children: [
        Text(
          question,
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),

        ///Image part\
        if (imageUrl != null) ImagePart(imageUrl: imageUrl),

        ///video part
        if (videoUrl != null) VideoPart(thumbnailUrl: videoThumbnailUrl, videoUrl: videoUrl!),

        GridView.builder(
          itemCount: choices.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3, // Wider buttons
          ),
          itemBuilder: (context, index) {
            return Consumer(
              builder: (_, ref, _) {
                final checkChoice = ref.watch(checkChoicesProvider2(index));
                final rightChoiceIndex = rightIndex ?? 0;
                return InkWell(
                  onTap: () {
                    (index == rightChoiceIndex)
                        ? ref.read(isRightWrongElse.notifier).state = 1
                        : ref.read(isRightWrongElse.notifier).state = 0;
                    for (int i = 0; i < choices.length; i++) {
                      if (i == index) {
                        ref.read(checkChoicesProvider2(i).notifier).state =
                        (i == rightChoiceIndex) ? 1 : 0;
                      } else {
                        ref.read(checkChoicesProvider2(i).notifier).state = -1;
                      }
                    }

                    if (rightChoiceIndex != index) {
                      onWrongAnswerTap(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        isPortrait ? 12.r : 26.4.r,
                      ),
                      gradient: LinearGradient(
                        colors:
                        (ref
                            .read(
                          checkChoicesProvider2(index).notifier,
                        )
                            .state ==
                            1)
                            ? [
                          AppColorScheme.startGradGreen,
                          AppColorScheme.midGradGreen,
                          AppColorScheme.hardGradGreen,
                        ]
                            : (ref
                            .read(
                          checkChoicesProvider2(index).notifier,
                        )
                            .state ==
                            0)
                            ? [
                          AppColorScheme.errorColor,
                          AppColorScheme.errorColor,
                          AppColorScheme.errorColor,
                        ]
                            : [
                          AppColorScheme.optionBg,
                          AppColorScheme.optionBg,
                          AppColorScheme.optionBg,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColorScheme.answerBoxShadow,
                          blurRadius: isPortrait ? 25.r : 55.r,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      border: Border(
                        bottom: BorderSide(
                          color:
                          (ref
                              .read(
                            checkChoicesProvider2(
                              index,
                            ).notifier,
                          )
                              .state ==
                              1)
                              ? AppColorScheme.rightOptionBorderColor
                              : (ref
                              .read(
                            checkChoicesProvider2(
                              index,
                            ).notifier,
                          )
                              .state ==
                              0)
                              ? AppColorScheme.optionBg
                              : AppColorScheme.labelTextColor,
                          width: isPortrait ? 4.r : 8.8.r,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      choices[index],
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: isPortrait ? 16.sp : 7.2.sp,
                        color: AppColorScheme.labelTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
