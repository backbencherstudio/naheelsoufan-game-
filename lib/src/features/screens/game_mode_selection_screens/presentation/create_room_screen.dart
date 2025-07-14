import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/create_room_widgets/custom_header_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/routes/route_name.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                CustomIconsButtons(icon: AppIcons.settings, onTap: () {}),
              ],
            ),
            SizedBox(height: 60.h),

            Text(
              "Create Room",

              style: style.headlineLarge!.copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffE0E0FF),
              ),
            ),
            SizedBox(height: 18.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: Color(0xffE0E0FF)),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  children: [
                    CustomHeaderTile(),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Enter Room Name ",
                            style: style.labelLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffE0E0FF),
                            ),
                          ),
                          Text(
                            "(Optional)",
                            style: style.labelLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffE0E0FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                                        SizedBox(height: 4.h,),

                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffffffff),
                            offset: Offset(1, 2), 
                            blurRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                      child: TextFormField(),
                    ),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Time",
                        style: style.labelLarge!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffE0E0FF),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    Container(
                       decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffffffff),
                            offset: Offset(1, 2), 
                            blurRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextFormField()),
                    SizedBox(height: 60.h),
                    CustomButton(
                      text: "CREATE ROOM",
                      onTap: () {
                       context.go(RouteName.questionAnswersScreen);
                      },
                      img: AppImages.primaryUpsidedown,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
