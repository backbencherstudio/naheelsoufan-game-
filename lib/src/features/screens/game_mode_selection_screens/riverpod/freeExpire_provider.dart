import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFreeModeOnProvider = StateProvider<bool>((ref)=>false);
final isOfflineOnProvider = StateProvider<bool>((ref)=>false);

final checkNormalGridScreen = StateProvider<bool>((ref){
  return true;
});

final checkGridSubscription = StateProvider<bool>((ref){
  return false;
});