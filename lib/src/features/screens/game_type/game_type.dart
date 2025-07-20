import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/mcq_question_with_image_video.dart';
import 'all_types/mcq_question/image_mcq_question.dart';
import 'all_types/mcq_question/multiple_choice_question.dart';
import 'all_types/true_false_question/true_false_question.dart';
import 'all_types/typed_question/typed_question.dart';

class GameType {
  /// normal multiple choice question
  static Widget multipleChoiceQuestion({
    required List<String> choices,
    required String question,
  }) => MultipleChoiceQuestion(choices: choices, question: question);

  /// true or false question
  static Widget trueFalseQuestion({required String question}) =>
      TrueFalseQuestion(question: question);

  /// typed question
  static Widget typedQuestion({required String question}) =>
      TypedQuestion(question: question);

  /// mcq question with image
  static Widget mcqQuestionWithImage({
    required List<String> choices,
    required String question,
    required String imageUrl,
  }) => McqQuestionWithImageVideo(
    choices: choices,
    question: question,
    imageUrl: imageUrl,
  );

  /// typed question with image
  static Widget typedQuestionWithImage({
    required String question,
    required String image,
  }) => TypedQuestion(question: question, image: image);

  ///
  static Widget imageMcqQuestion({
    required List<String> choicesImageURL,
    required String question,
  }) => ImageMcqQuestion(choicesImageURL: choicesImageURL, question: question);
  static Widget mcqQuestionWithVideo({
    required List<String> choices,
    required String question,
    required String videoUrl,
    required String videoThumbnailUrl,
  }) => McqQuestionWithImageVideo(
    choices: choices,
    question: question,
    videoUrl: videoUrl,
    videoThumbnailUrl: videoThumbnailUrl,
  );

  ///chinmoy


  ///true false with image
  ///typed question with video
  ///true false with video
}
