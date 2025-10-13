import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/services/stripe_services.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/riverpod/loading.dart';
import 'package:naheelsoufan_game/src/data/riverpod/subscription/subscription_controller.dart';
import 'package:naheelsoufan_game/src/data/riverpod/user/user_controller.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/subscription_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/payment_share_dialog_widgets/show_dialog.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/repository/subscription/subscription_service.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionData = ref.watch(gameSubscriptionProvider);
    final currentIndex = ref.watch(selectedSubscriptionIndex);
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final userData = ref.watch(userProvider);
    final loading = ref.watch(isLoading);
    return Scaffold(
      body: CreateScreen(
        key: keys,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
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
              SizedBox(height: 28.h),
              Column(
                children: [
                  Text(
                    'Unlock All Features',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'All 25+ categories unlocked',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColorScheme.listContainerColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () async {
                  context.push(RouteName.myAccountScreen);
                },
                child: PaymentCardWidget(
                  title: 'Games',
                  subtitle:
                      '${subscriptionData?.data[currentIndex].games ?? 0}',
                  title2: 'Max Players',
                  subtitle2:
                      ': Up to ${subscriptionData?.data[currentIndex].players ?? 0} Players',
                  description:
                      'Get your game on with ${subscriptionData?.data[currentIndex].questions ?? 0} exiting questions of fun with your friends!',
                  borderColor: AppColorScheme.surface,
                  rocketBackground: AppColorScheme.greenborder,
                  buttonText:
                      '\$${subscriptionData?.data[currentIndex].price ?? 0.00} per ${subscriptionData?.data[currentIndex].games ?? 0} games',
                  quality: subscriptionData?.data[currentIndex].type ?? "NULL",
                  color: AppColorScheme.greenborder,
                  onPressed: () {
                    // STRIPE
                  },
                ),
              ),

              Spacer(),
              GestureDetector(
                onTap: () async {
                  ref.read(isLoading.notifier).state = true;
                  final intent =
                      await SubscriptionService().fetchPaymentIntentData(
                        subscriptionData?.data[currentIndex].id ?? "",
                      );
                  if (intent?.success != true) {
                    final checkResult = await SubscriptionService().fetchSubscriptionLastIntentStatus();
                    debugPrint("Payment Failed");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: (checkResult?.paymentStatus == "completed") ? const Text('You have already subscribed a package') : const Text('Payment Failed'),
                          backgroundColor: AppColorScheme.error
                      ),
                    );
                    ref.read(isLoading.notifier).state = false;
                    return;
                  }
                  await StripeServices.makePayment(
                    intent?.data.clientSecret ?? "N/A",
                    userData?.name ?? "N/A",
                  );

                  final result = await SubscriptionService().fetchSubscriptionLastIntentStatus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: (result?.paymentStatus == "completed") ? const Text('Payment Successful') : const Text('Payment Failed'),
                        backgroundColor: (result?.paymentStatus == "completed") ? AppColorScheme.greenBg : AppColorScheme.error,
                      ),
                    );
                  //AFTER SUCCESSFUL PAYMENT
                  if(result?.paymentStatus == "completed") onPaymentButton(context);
                  ref.read(isLoading.notifier).state = false;
                },
                child: Container(
                  width: 115.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: AppColorScheme.customGreenBT,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border(
                      bottom: BorderSide(
                        color: AppColorScheme.greenborder,
                        width: 2.w,
                      ),
                    ),
                  ),
                  child: Center(
                    child:
                        loading
                            ? const CircularProgressIndicator()
                            : Text(
                              'Pay',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(color: Colors.white),
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
