import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/subcription/subcription_model.dart';

final gameSubscriptionProvider = StateProvider<SubscriptionModel?>((ref) => null);
final selectedSubscriptionIndex = StateProvider<int>((ref) => 0);