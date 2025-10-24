import 'package:flutter_riverpod/flutter_riverpod.dart';

final difficultyLevel = StateProvider<int>((ref)=>0);

final isDifficultyVanished = StateProvider<bool>((ref)=>false);

final isQuestionVanished = StateProvider<List<int>>((ref)=>[]);

final isQuestionVanishTeam1 = StateProvider<List<int>>((ref)=>[]);

final isQuestionVanishTeam2 = StateProvider<List<int>>((ref)=>[]);

/// q1 : {1,2,3}
/// q2 : {1,2,3}
/// q3 : {1,2,3}