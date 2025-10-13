import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/riverpod/loading.dart';
import 'package:naheelsoufan_game/src/data/riverpod/subscription/subscription_controller.dart';
import 'package:naheelsoufan_game/src/data/riverpod/user/user_controller.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/edit_profile_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import 'package:naheelsoufan_game/src/features/screens/account_screens/presentation/widgets/my_account_wodgets/subs_status.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/repository/subscription/subscription_service.dart';
import '../../../common_widegts/music_off_on_whole_screen/music_volume_widgets.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../riverpod/profile_state_notifier.dart';

class MyAccountScreen extends ConsumerStatefulWidget {
  const MyAccountScreen({super.key});

  @override
  ConsumerState<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends ConsumerState<MyAccountScreen> {

  @override
  void initState() {
    Future.microtask(() async {
      ref.read(isLoading.notifier).state = true;
      ref.read(userSubscriptionDataProvider.notifier).state = await SubscriptionService().fetchUserSubscription();
      ref.read(isLoading.notifier).state = false;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final selectedIndex = ref.watch(selectedProfileProvider);
    final userData = ref.watch(userProvider);
    final userSubscriptionData = ref.watch(userSubscriptionDataProvider);
    final loading = ref.watch(isLoading);

    return Scaffold(
      body: CreateScreen(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomIconsButtons(
                    icon: AppIcons.backIcons,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 40.h),

                  Stack(
                    children: [
                      SizedBox(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(top: 40.h),
                            width: 385.w,
                            decoration: BoxDecoration(
                              color: AppColorScheme.deepPuroleBG,
                              border: Border.all(
                                color: AppColorScheme.listContainerColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                28.w,
                                60.h,
                                28.w,
                                0.h,
                              ),
                              child: loading ? const CircularProgressIndicator() : Column(
                                children: [
                                  selectedIndex != null
                                      ? Image.asset(
                                        AppIcons.profileImages[selectedIndex],
                                        height: 80.h,
                                        width: 80.w,
                                        fit: BoxFit.cover,
                                      )
                                      : Image.asset(
                                        AppIcons.profile01,
                                    height: 80.h,
                                    width: 80.w,
                                      ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    userData?.name ?? 'N/A',
                                    style: style.bodyLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    userData?.email ?? 'N/A',
                                    style: style.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  GestureDetector(
                                    onTap: () {
                                      context.push(RouteName.editProfileScreen);
                                    },
                                    child: EditProfileButton(style: style),
                                  ),
                                  SizedBox(height: 16.h),
                                  Divider(
                                    color: AppColorScheme.listContainerColor,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "Subscription Status",
                                    style: style.titleLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Type',
                                    pilot: "${userSubscriptionData?.data.subscriptionType.type  ?? "N/A"}(${(userSubscriptionData?.data.isActive ?? false) ? "Active" : "Inactive"})",
                                  ),
                                  SizedBox(height: 12.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Games Remaining',
                                    pilot: userSubscriptionData?.data.gamesRemaining.toString() ?? "N/A",
                                  ),
                                  SizedBox(height: 12.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Max Players',
                                    pilot: userSubscriptionData?.data.subscriptionType.players.toString() ?? "N/A",
                                  ),
                                  SizedBox(height: 12.h),
                                  SubscriptionStatus(
                                    style: style,
                                    type: 'Questions Per Games',
                                    pilot: userSubscriptionData?.data.subscriptionType.questions.toString() ?? "N/A",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 13,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: HeaderButton(
                            textTitle: 'My Account',
                            textStyle: style.titleLarge?.copyWith(
                              color: AppColorScheme.labelTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                            borderColor: AppColorScheme.labelTextColor,
                            gradientColor: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColorScheme.softYellow,
                                AppColorScheme.midYellow,
                                AppColorScheme.darkYellow,
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
                  SizedBox(height: 36.h),
                  MusicOffOnWholePage(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


