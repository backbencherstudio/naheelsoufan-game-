import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/game_type.dart';

class QuestionAnswerScreen extends StatelessWidget {
  const QuestionAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Column(
            children: [
              GameType.multipleChoiceQuestion(
                choices: ["India", "China", "Bangladesh", "Indonesia"],
                question: "Which country has the highest population?",
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.trueFalseQuestion(
                question: "The Great Wall of China is visible from space.",
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.typedQuestion(
                question: "What is the capital of France?",
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.mcqQuestionWithImage(
                choices: ["India", "China", "Bangladesh", "Indonesia"],
                question: "Which country has the highest population?",
                imageUrl:
                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQmViWnNipQWJjIDBvO6MPCd2qFAigro8hJi8W_NUfLyWoib9KBOzMz1f7M6EQA5kEZtafls60NR4ROKM2c4eFIAigEIxBm_SzoZ8axgvA',
              ),

              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),

              GameType.typedQuestionWithImage(
                question: 'Which country has the highest population?',
                image:
                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQmViWnNipQWJjIDBvO6MPCd2qFAigro8hJi8W_NUfLyWoib9KBOzMz1f7M6EQA5kEZtafls60NR4ROKM2c4eFIAigEIxBm_SzoZ8axgvA',
              ),

              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.imageMcqQuestion(
                choicesImageURL: [
                  'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
                  'https://www.worldanimalprotection.org/cdn-cgi/image/width=1920,format=auto/globalassets/images/elephants/1033551-elephant.jpg',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOG5TM1EovYcHRS_Uoi7lufuMrQ3slzfmoLg&s',
                  'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
                ],
                question:
                    'Which one is Horse? Select correct one from image below?',
              ),

              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),

              GameType.mcqQuestionWithVideo(
                choices: ["India", "China", "Bangladesh", "Indonesia"],
                question: "Which country has the highest population?",
                videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                videoThumbnailUrl: 'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.trueFalseQuestionWithImage(
                  question: "What is in the image?",
                  image: 'https://www.worldanimalprotection.org/cdn-cgi/image/width=1920,format=auto/globalassets/images/elephants/1033551-elephant.jpg'
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.trueFalseQuestionWithVideo(
                  question: "What is in the video?",
                  thumbnail: 'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
                  video: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.typedQuestionWithImage(
                  question: "What is in the image?",
                  image: 'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              GameType.typedQuestionWithVideo(
                  question: "What is in the video?",
                  thumbnail: 'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
                  video: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
