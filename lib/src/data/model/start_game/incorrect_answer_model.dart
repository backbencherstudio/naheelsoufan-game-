class IncorrectAnswerModel {
  final bool success;
  final String message;
  final QuizData data;

  IncorrectAnswerModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory IncorrectAnswerModel.fromJson(Map<String, dynamic> json) {
    return IncorrectAnswerModel(
      success: json['success'],
      message: json['message'],
      data: QuizData.fromJson(json['data']),
    );
  }
}

class QuizData {
  final bool isCorrect;
  final int playerScore;
  final Answer correctAnswer;
  final String nextAction;
  final Question currentQuestion;
  final Map<String, List<PlayerHistory>> allPlayersHistory;

  QuizData({
    required this.isCorrect,
    required this.playerScore,
    required this.correctAnswer,
    required this.nextAction,
    required this.currentQuestion,
    required this.allPlayersHistory,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) {
    return QuizData(
      isCorrect: json['is_correct'],
      playerScore: json['player_score'],
      correctAnswer: Answer.fromJson(json['correct_answer']),
      nextAction: json['next_action'],
      currentQuestion: Question.fromJson(json['current_question']),
      allPlayersHistory: (json['all_players_history'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(
          key,
          (value as List).map((e) => PlayerHistory.fromJson(e)).toList(),
        ),
      ),
    );
  }
}

class Answer {
  final String id;
  final String text;

  Answer({
    required this.id,
    required this.text,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      text: json['text'],
    );
  }
}

class Question {
  final String id;
  final String text;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.text,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      answers: (json['answers'] as List).map((e) => Answer.fromJson(e)).toList(),
    );
  }
}

class PlayerHistory {
  final String category;
  final String difficulty;

  PlayerHistory({
    required this.category,
    required this.difficulty,
  });

  factory PlayerHistory.fromJson(Map<String, dynamic> json) {
    return PlayerHistory(
      category: json['category'],
      difficulty: json['difficulty'],
    );
  }
}
