import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/mcq_question_with_image_video.dart';
import 'all_types/mcq_question/image_mcq_question.dart';
import 'all_types/mcq_question/multiple_choice_question.dart';
import 'all_types/true_false_question/true_false_question.dart';
import 'all_types/typed_question/typed_question.dart';

class GameType {
  /// normal multiple choice question & True false
  static Widget multipleChoiceQuestion({
    required List<String> choices,
    required String question,
    int? rightChoice,
  }) => McqQuestionWithImageVideo(
    choices: choices,
    question: question,
    rightIndex: rightChoice,
  );

  /// mcq question with video & True False with Image
  static Widget mcqQuestionWithVideo({
    required List<String> choices,
    required String question,
    required String videoUrl,
    required String videoThumbnailUrl,
    int? rightChoice,
  }) => McqQuestionWithImageVideo(
    choices: choices,
    question: question,
    videoUrl: videoUrl,
    videoThumbnailUrl: videoThumbnailUrl,
    rightIndex: rightChoice,
  );

  /// mcq question with image  & True False with Image
  static Widget mcqQuestionWithImage({
    required List<String> choices,
    required String question,
    required String imageUrl,
    int? rightChoice,
  }) => McqQuestionWithImageVideo(
    choices: choices,
    question: question,
    imageUrl: imageUrl,
    rightIndex: rightChoice,
  );

  /// image mcq answer question (PORE KORTE HOBE)
  static Widget imageMcqQuestion({
    required List<String> choicesImageURL,
    required String question,
    required int rightIndex,
  }) => ImageMcqQuestion(choicesImageURL: choicesImageURL, question: question, rightIndex: rightIndex,);

  // /// true or false question
  // static Widget trueFalseQuestion({required String question}) =>
  //     TrueFalseQuestionWithImageVideo(question: question);
  //
  // /// true or false question with image
  // static Widget trueFalseQuestionWithImage({
  //   required String question,
  //   required String image,
  // }) =>
  //     TrueFalseQuestionWithImageVideo(question: question, imageUrl: image,);
  //
  // /// true or false question with video
  // static Widget trueFalseQuestionWithVideo({
  //   required String question,
  //   required String thumbnail,
  //   required String video,
  // }) => TrueFalseQuestionWithImageVideo(question: question, videoThumbnailUrl: thumbnail, videoUrl: video,);

  /// typed question
  static Widget typedQuestion({required String question, required String answer}) =>
      TypedQuestionWithImageVideo(
          question: question,
          rightAnswer: answer,
      );

  /// typed question with image
  static Widget typedQuestionWithImage({
    required String question,
    required String image,
    required String answer
  }) => TypedQuestionWithImageVideo(question: question, imageUrl: image, rightAnswer: answer,);

  ///typed question with video
  static Widget typedQuestionWithVideo({
    required String question,
    required String thumbnail,
    required String video,
    required String answer
  }) => TypedQuestionWithImageVideo(question: question, videoUrl: video, videoThumbnailUrl: thumbnail, rightAnswer: answer,);

  ///chinmoy


  ///true false with image
  ///typed question with video
  ///true false with video
}
