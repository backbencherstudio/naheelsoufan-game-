import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkChoicesProvider = StateProvider.family<int, int>((ref, status) => -1);