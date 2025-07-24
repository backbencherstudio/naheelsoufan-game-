import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/choose_subscription_widgets/subscription_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/payment_share_dialog_widgets/show_dialog.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/routes/route_name.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
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
                  CustomIconsButtons(icon: AppIcons.threeDot, onTap: () {})
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
                      color: Color(0xffE0E0FF),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: (){
                  context.push(RouteName.myAccountScreen);
                },
                child: PaymentCardWidget(
                  title: 'Games',
                  subtitle: ": 6 games",
                  title2: 'Max Players',
                  subtitle2: ': Up to 8 Players',
                  description:
                      'Get your game on with 3 quick rounds of fun with your friends!',
                  borderColor: Color(0xff1D5128),
                  rocketBackground: Color(0xffB8F1B9),
                  buttonText: '\$10 per 3 game',
                  quality: 'Standard',
                  color: Color(0xffB8F1B9),
                ),
              ),

              Spacer(),
              GestureDetector(
                onTap: () {
                  onPaymentButton(context);
                },
                child: Container(
                  width: 115.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: Color(0xff008A39),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border(
                      bottom: BorderSide(color: Color(0xffB8F1B9), width: 2.w),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Pay',
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.white),
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
