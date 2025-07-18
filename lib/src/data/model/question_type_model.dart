class QuestionTypeModel {
  final String questionId;
  final String iconUrl;
  final String questionCategory;
  final int questionNumber;
  final String questionLevel;

  QuestionTypeModel({
   required this.questionId,
    required this.iconUrl,
    required this.questionLevel,
    required this.questionNumber,
    required this.questionCategory
  });
}