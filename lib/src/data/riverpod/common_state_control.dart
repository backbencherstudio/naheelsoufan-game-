import 'package:flutter_riverpod/flutter_riverpod.dart';

final specialButtonController = StateProvider.family<bool, int> ((ref, id){
  return false;
});

final isClick = StateProvider<bool> ((ref){
  return false; // naming issue isClickedProvider
});

final isSelectedVal = StateProvider<String?> ((ref){
  return null;
});