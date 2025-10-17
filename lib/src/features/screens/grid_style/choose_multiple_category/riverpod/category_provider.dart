import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListProvider = StateProvider<List<int>>((ref)=>[]);

final isCategorySelectedClicked = StateProvider.family<bool, int>((ref, questionID)=>false);

final isSomethingClicked = StateProvider<bool>((ref)=>false);