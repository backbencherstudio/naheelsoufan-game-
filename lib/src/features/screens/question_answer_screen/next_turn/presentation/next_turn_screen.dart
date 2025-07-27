import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../common_widegts/create_screen/create_screen.dart';
import '../../../account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import '../../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

class NextTurnScreen extends StatelessWidget {
  const NextTurnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final style = Theme.of(context).textTheme;
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
                  CustomIconsButtons(icon: AppIcons.threeDot, onTap: () {}),
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 40.h),
                      width: 385.w,
                      decoration: BoxDecoration(
                        color: const Color(0xff3D4279),
                        border: Border.all(
                          color: const Color(0xffE0E0FF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          126.w,
                          60.h,
                          126.w,
                          48.h,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              AppIcons.profile03,
                              height: 110.h,
                              width: 110.w,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Player 2',
                              style: style.titleLarge?.copyWith(
                                color: Color(0xffE0E0FF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: HeaderButton(
                        textTitle: 'Next Turn',
                        textStyle: style.titleLarge?.copyWith(
                          color: Color(0xff2E1126),
                          fontWeight: FontWeight.w500,
                        ),
                        borderColor: Color(0xff2E1126),
                        gradientColor: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF2E792),
                            Color(0xFFF8B133),
                            Color(0xFFDE712B),
                          ],
                          stops: [0.0, 0.4904, 1.0],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // context.push(RouteName.paymentScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 66.w,
                    vertical: 16.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 64.w,
                    // vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff008A39),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border(
                      bottom: BorderSide(color: Color(0xffB8F1B9), width: 2.w),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'NEXT',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
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
