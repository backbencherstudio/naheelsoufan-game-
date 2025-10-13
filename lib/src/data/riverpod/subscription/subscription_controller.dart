import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/data/model/subcription/user_subscription_model.dart';
import '../../model/subcription/payment_intent_model.dart';
import '../../model/subcription/subcription_model.dart';

final gameSubscriptionProvider = StateProvider<SubscriptionModel?>((ref) => null);
final selectedSubscriptionIndex = StateProvider<int>((ref) => 0);

final userSubscriptionDataProvider = StateProvider<UserSubscriptionModel?>((ref) => null);