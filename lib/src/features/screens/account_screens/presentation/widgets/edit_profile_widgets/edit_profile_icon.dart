import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../riverpod/profile_state_notifier.dart';

class EditProfileIcon extends ConsumerWidget {
  const EditProfileIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedProfileProvider);
    final isNotTab = Utils.isTablet(context);
    return SizedBox(
      height: 80.h,
      width: 80.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          selectedIndex != null
              ? Image.asset(
                AppIcons.profileImages[selectedIndex],
                height: 80.h,
                width: 80.w,
              )
              : Image.asset(AppIcons.profile01, height: 80.h, width: 80.w),

          Positioned(
            top: isNotTab ? -12.h : null,
            right: isNotTab ? -8.w : 20.w,
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: GestureDetector(
                onTap: () {
                  context.push(RouteName.profileIconScreen);
                },
                child: Consumer(
                  builder: (_, ref, __) {
                    return SvgPicture.asset(
                      AppIcons.editFilledBle,
                      height: 24.h,
                      width: 24.w,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
