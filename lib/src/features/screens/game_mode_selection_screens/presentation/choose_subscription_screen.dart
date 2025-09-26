import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/repository/subscription/subscription_repository_implementation.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/pay_to_play.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/subscription_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../data/riverpod/game_controller.dart';
import '../../../../data/riverpod/subscription_controller.dart';

class ChoosePaymentCard extends ConsumerStatefulWidget {
  const ChoosePaymentCard({super.key});

  @override
  ConsumerState<ChoosePaymentCard> createState() => _ChoosePaymentCardState();
}

class _ChoosePaymentCardState extends ConsumerState<ChoosePaymentCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSubscriptionData(ref);
  }

  Future<void> loadSubscriptionData(WidgetRef ref) async {
    // final data = await SubscriptionRepositoryImplementation().fetchSubscriptionData();
    // ref.read(gameSubscriptionProvider.notifier).state = data;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final subscriptionData = ref.watch(gameSubscriptionProvider);
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
              Expanded(
                child: ListView.builder(
                  itemCount: subscriptionData?.length ?? 0,
                    itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: PaymentCardWidget(
                      title: 'Games',
                      subtitle: '${subscriptionData?[index].games ?? 0}',
                      title2: 'Max Players',
                      subtitle2: ': Up to ${subscriptionData?[index].players ?? 0} Players',
                      description:
                      'Get your game on with ${subscriptionData?[index].questions ?? 0} exiting questions of fun with your friends!',
                      borderColor: AppColorScheme.secondary,
                      rocketBackground: AppColorScheme.borderColor,
                      buttonText: '\$${subscriptionData?[index].price ?? 0.00} per ${subscriptionData?[index].games ?? 0} games',
                      quality: subscriptionData?[index].type ?? "NULL",
                      color: AppColorScheme.borderColor,
                      onPressed: (){
                        ref.read(selectedSubscriptionIndex.notifier).state = index;
                        context.push(RouteName.paymentScreen);
                      },
                    ),
                  );
                })
              ),
              // GestureDetector(
              //   onTap: () {
              //     context.push(RouteName.paymentScreen);
              //   },
              //   child: Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 66.w,
              //       vertical: 16.h,
              //     ),
              //     margin: EdgeInsets.symmetric(horizontal: 64.w),
              //     decoration: BoxDecoration(
              //       color: AppColorScheme.customGreenBT,
              //       borderRadius: BorderRadius.circular(8.r),
              //       border: Border(
              //         bottom: BorderSide(
              //           color: AppColorScheme.greenborder,
              //           width: 2.w,
              //         ),
              //       ),
              //     ),
              //     child: Center(
              //       child: Text(
              //         'NEXT',
              //         style: Theme.of(context).textTheme.titleSmall?.copyWith(
              //           color: Colors.white,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
