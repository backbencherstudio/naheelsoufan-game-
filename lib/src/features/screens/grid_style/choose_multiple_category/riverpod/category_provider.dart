import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListProvider = StateProvider<Map<String?, String?>>((ref)=>{});

final isCategorySelectedClicked = StateProvider.family<bool, int>((ref, questionID)=>false);

final isSomethingClicked = StateProvider<bool>((ref)=>false);