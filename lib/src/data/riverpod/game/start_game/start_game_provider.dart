import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/start_game/start_game_question_model.dart';

final categoryId = StateProvider<String?>((ref) => null);
final difficultyId = StateProvider<String?>((ref) => null);


/// Question Response Handling
///

final questionResponseProvider = StateProvider<GameQuestionResponseModel?>((ref)=> null);