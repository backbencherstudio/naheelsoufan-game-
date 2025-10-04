import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../grid_play_game/riverpod/function.dart';
import '../../../main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import '../../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
import '../../riverpod/multiple_choice_provider.dart';

class ImageMcqQuestion extends StatelessWidget {
  final List<String> choicesImageURL;
  final String question;
  final int? rightIndex;
  const ImageMcqQuestion({
    super.key,
    required this.choicesImageURL,
    required this.question,
    required this.rightIndex,
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
        const SizedBox(height: 20),
        GridView.builder(
          itemCount: choicesImageURL.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5, // Wider buttons
          ),
          itemBuilder: (context, index) {
            return Consumer(
              builder: (_, ref, _) {
                final controller = ref.read(playerProvider.notifier);
                final current = ref.read(playerProvider);
                final next = (current.currentPlayer + 1) % current.totalPlayer;
                final huntMode = ref.watch(huntModeOn);
                final checkChoice = ref.watch(checkChoicesProvider(index));
                final rightChoiceIndex = rightIndex ?? 0;
                return InkWell(
                  onTap: (){
                    (index == rightChoiceIndex) ? ref.read(isRightWrongElse.notifier).state = 1 : ref.read(isRightWrongElse.notifier).state = 0;

                    for (int i = 0; i < choicesImageURL.length; i++) {
                      if (i == index) {
                        ref.read(checkChoicesProvider(i).notifier).state =
                        (i == rightChoiceIndex) ? 1 : 0;
                      } else {
                        ref.read(checkChoicesProvider(i).notifier).state = -1;
                      }
                    }

                    if (ref.read(isRightWrongElse.notifier).state == 0) {
                      for (int i = 0; i < 4; i++) {
                        ref.read(checkChoicesProvider(i).notifier).state = -1;
                      }
                      ref.read(selectedPlayerIndexProvider.notifier).state = -1;
                      ref.read(huntModeOn.notifier).state = !huntMode;

                      log("\n\n\nWRONG!!!\n\n\n");
                      if(huntMode == true){
                        ref.read(advanceTurnFlagProvider.notifier).state = true;
                        controller.state = current.copyWith(currentPlayer: next);
                      } else {
                        ref.read(autoCounterProvider(60).notifier).reset();
                        onWrongAnswerTap(context, choicesImageURL[rightChoiceIndex], ref);
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref.read(autoCounterProvider(60).notifier).reset();
                      });
                    } else {
                      ref.read(advanceTurnFlagProvider.notifier).state = true;
                      controller.state = current.copyWith(currentPlayer: next); // CB
                    }
                    log("is wrong = $huntMode");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        isPortrait ? 12.r : 26.4.r,
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
                          (checkChoice ==
                              1)
                              ? AppColorScheme.rightOptionBorderColor
                              : (checkChoice ==
                              0)
                              ? AppColorScheme.optionBg
                              : AppColorScheme.labelTextColor,
                          width: isPortrait ? 4.r : 8.8.r,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(choicesImageURL[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
            );
          },
        ),
      ],
    );
  }
}
