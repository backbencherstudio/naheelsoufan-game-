import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/riverpod/loading.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/pay_to_play.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/subscription_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../data/repository/subscription/subscription_service.dart';
import '../../../../data/riverpod/subscription/subscription_controller.dart';

class ChooseSubscriptionScreen extends ConsumerStatefulWidget {
  const ChooseSubscriptionScreen({super.key});

  @override
  ConsumerState<ChooseSubscriptionScreen> createState() => _ChoosePaymentCardState();
}

class _ChoosePaymentCardState extends ConsumerState<ChooseSubscriptionScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      ref.read(isLoading.notifier).state = true;
      ref.read(gameSubscriptionProvider.notifier).state = await SubscriptionService().fetchSubscriptionData();
      ref.read(isLoading.notifier).state = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final subscriptionResponse = ref.watch(gameSubscriptionProvider);
    final loading = ref.watch(isLoading);
    return Scaffold(
      body: CreateScreen(
        key: keys,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconsButtons(
                    icon: AppIcons.backSvg,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                  CustomPopUpMenu(),
                ],
              ),
              SizedBox(height: 40.h),
              Center(child: PayToPlay()),
              SizedBox(height: 40.h),
              loading ? const CircularProgressIndicator() : (subscriptionResponse?.data == null) ? Text("No Subscription Found") : Expanded(
                child: ListView.builder(
                  itemCount: subscriptionResponse?.data.length,
                    itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: PaymentCardWidget(
                      title: 'Games',
                      subtitle: '${subscriptionResponse?.data[index].games ?? 0}',
                      title2: 'Max Players',
                      subtitle2: ': Up to ${subscriptionResponse?.data[index].players ?? 0} Players',
                      description:
                      'Get your game on with ${subscriptionResponse?.data[index].questions ?? 0} exiting questions of fun with your friends!',
                      borderColor: AppColorScheme.secondary,
                      rocketBackground: AppColorScheme.borderColor,
                      buttonText: '\$${subscriptionResponse?.data[index].price ?? 0.00} per ${subscriptionResponse?.data[index].games ?? 0} games',
                      quality: subscriptionResponse?.data[index].type ?? "NULL",
                      color: AppColorScheme.borderColor,
                      onPressed: (){
                        ref.read(selectedSubscriptionIndex.notifier).state = index;
                        context.push(RouteName.paymentScreen);
                      },
                    ),
                  );
                })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
