import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/subcription/subcription_model.dart';

final gameSubscriptionProvider = StateProvider<List<SubscriptionModel>?>((ref) => []);
final selectedSubscriptionIndex = StateProvider<int>((ref) => 0);