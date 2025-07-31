import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPlayerIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

