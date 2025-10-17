import 'package:flutter_riverpod/flutter_riverpod.dart';

final difficultyLevel = StateProvider<int>((ref)=>0);

final isDifficultyVanished = StateProvider.family<bool, int>((ref, index) => false);