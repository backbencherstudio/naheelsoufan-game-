class GameQuestionResponse {
  final bool success;
  final String message;
  final GameData data;

  GameQuestionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GameQuestionResponse.fromJson(Map<String, dynamic> json) {
    return GameQuestionResponse(
      success: json['success'],
      message: json['message'],
      data: GameData.fromJson(json['data']),
    );
  }
}

class GameData {
  final Question question;
  final CurrentPlayer currentPlayer;
  final GameInfo gameInfo;

  GameData({
    required this.question,
    required this.currentPlayer,
    required this.gameInfo,
  });

  factory GameData.fromJson(Map<String, dynamic> json) {
    return GameData(
      question: Question.fromJson(json['question']),
      currentPlayer: CurrentPlayer.fromJson(json['currentPlayer']),
      gameInfo: GameInfo.fromJson(json['game_info']),
    );
  }
}

//"question_type": {
//                 "id": "cmfzckp1s0007wsosztwnnxfx",
//                 "name": "Options"
//             },

class Question {
  final String id;
  final String text;
  final int points;
  final int timeLimit;
  final String? fileUrl;
  final List<Answer> answers;
  final QuestionType questionType;

  Question({
    required this.id,
    required this.text,
    required this.points,
    required this.timeLimit,
    this.fileUrl,
    required this.answers,
    required this.questionType
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      points: json['points'],
      timeLimit: json['time_limit'],
      fileUrl: json['file_url'],
      answers: List<Answer>.from(json['answers'].map((x) => Answer.fromJson(x))),
      questionType: QuestionType.fromJson(json['question_type']),
    );
  }
}

class QuestionType {
  final String id;
  final String name;

  QuestionType({
    required this.id,
    required this.name,
  });

  factory QuestionType.fromJson(Map<String, dynamic> json) {
    return QuestionType(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Answer {
  final String id;
  final String text;
  final String? fileUrl;

  Answer({
    required this.id,
    required this.text,
    this.fileUrl,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      text: json['text'],
      fileUrl: json['file_url'],
    );
  }
}

class CurrentPlayer {
  final String id;
  final String? name;
  final int? playerOrder;

  CurrentPlayer({
    required this.id,
    this.name,
    this.playerOrder,
  });

  factory CurrentPlayer.fromJson(Map<String, dynamic> json) {
    return CurrentPlayer(
      id: json['id'],
      name: json['name'],
      playerOrder: json['player_order'],
    );
  }
}

class GameInfo {
  final int currentQuestionNumber;

  GameInfo({
    required this.currentQuestionNumber,
  });

  factory GameInfo.fromJson(Map<String, dynamic> json) {
    return GameInfo(
      currentQuestionNumber: json['current_question_number'],
    );
  }
}
