import 'package:flutter_riverpod/flutter_riverpod.dart';

final modeProvider = StateProvider<int>((ref)=>-1);

// -1 ===== null
// 1 ====== QUICK OFFLINE
// 2 ===== QUICK ONLINE
// 3 ====== GRID
