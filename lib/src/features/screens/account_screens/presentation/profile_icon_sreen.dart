import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/edit_profile_widgets/edit_profile_icon.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import '../../../../core/constant/icons.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../riverpod/profile_state_notifier.dart';

class ProfileIconScreen extends ConsumerWidget {
  const ProfileIconScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedProfileProvider);
    final style = Theme.of(context).textTheme;

    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 10.h),

                Expanded(
                  child: Stack(
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
                              28.w,
                              40.h,
                              28.w,
                              28.h,
                            ),
                            child: Column(
                              children: [
                                EditProfileIcon(),
                                SizedBox(height: 12.h),
                                Divider(color: Color(0xff6B71B9)),
                                SizedBox(height: 40.h),

                                Expanded(
                                  child: GridView.builder(
                                    itemCount: AppIcons.profileImages.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          crossAxisSpacing: 8.w,
                                          mainAxisSpacing: 8.h,
                                          childAspectRatio: 1,
                                        ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(
                                                selectedProfileProvider
                                                    .notifier,
                                              )
                                              .selectProfile(
                                                index,
                                              ); // Select profile
                                        },
                                        child: Center(
                                          child: Container(
                                            padding: EdgeInsets.all(3.r),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    selectedIndex == index
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                            child: Image.asset(
                                              AppIcons.profileImages[index],
                                              width: 60.w,
                                              height: 60.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(height: 40.h),
                                HeaderButton(
                                  textTitle: 'Update',
                                  padding: EdgeInsets.all(8.r),
                                  width: double.infinity,
                                  height: 58.h,
                                  borderColor: Color(0xff1D5128),
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
                            textTitle: 'Change Icon',
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
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
