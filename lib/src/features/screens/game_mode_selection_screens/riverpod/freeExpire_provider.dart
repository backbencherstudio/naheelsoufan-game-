import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFreeModeOnProvider = StateProvider<bool>((ref)=>false);
final isOfflineOnProvider = StateProvider<bool>((ref)=>false);