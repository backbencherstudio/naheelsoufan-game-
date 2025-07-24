import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/primary_button.dart';

import '../../../../../../../core/constant/icons.dart';


void onWrongAnswerTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 1,
        child: SizedBox(
          height: 791.h,
          child: Stack(
            children: [
              Positioned(
                top: 142.h,
                child: Container(
               constraints: BoxConstraints(
                 minHeight: 371.h,
                 maxHeight: 410.h,
                 minWidth: 280.w,
                 maxWidth: 330.w
               ),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFB4AB), width: 3),
                    color: Color(0xffFFDAD6),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.h,),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Wrong Answer',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff93000A),
                                fontSize: 28.sp,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 44.h),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff009940),
                              width: 1,
                            ),
                            color: Color(0xffEBFFE7),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Correct Answer is',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Color(0xff009940),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              SizedBox(height: 12.w),
                              PrimaryButton(
                                text: 'China',
                                isSelected: true,
                                onTap: () {},
                                width: 166.w,
                                color: Colors.white,
                              ),
                              SizedBox(height: 16.w),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 44.h),
                      Expanded(
                        child: HeaderButton(
                          textTitle: 'Change to steal the point',
                          borderColor: Color(0xffFFB4AB),
                          borderWidth: 3,
                          borderRadius: BorderRadius.circular(8.r),
                          textStyle: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Color(0xffFFDAD6),
                                fontWeight: FontWeight.w500,
                              ),

                          gradientColor: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFFF5449),
                              Color(0xFFFF5449),
                              Color(0xFFFF5449),
                            ],
                            stops: [0.0, 0.4904, 1.0],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h,),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 110.h,
                left: 130.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.circleSgv),
                    Positioned(
                        child: SvgPicture.asset(AppIcons.wrong))
                  ],
                ),
              ),

              Positioned(
                top: 115.h,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(child: SvgPicture.asset(AppIcons.cancelSvg)),
                ),
              ),

              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.circleSgv,width: 36.w,height: 36.h,),
                      Positioned(
                          child: Padding(
                            padding:  EdgeInsets.all(2.r),
                            child: Text('5',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Color(0xffBA1A1A),
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp
                            ),),
                          ))
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    },
  );
}
