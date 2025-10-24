import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../data/riverpod/user/user_controller.dart';
import '../../../riverpod/profile_state_notifier.dart';

class EditProfileIcon extends ConsumerWidget {
  const EditProfileIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotTab = Utils.isTablet(context);
    final userData = ref.watch(userProvider);
    return SizedBox(
      height: 80.h,
      width: 80.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.network(userData?.avatarUrl ?? "https://imgs.search.brave.com/wDY22YDuMUArJUYHi_P2HFGfQk_uDnm0xhaxUXdOEW4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG40/Lmljb25maW5kZXIu/Y29tL2RhdGEvaWNv/bnMvbWVuLWF2YXRh/cnMtaWNvbnMtc2V0/LTIvMjU2LzMwLTEy/OC5wbmc",
            height: 24.w, width: 24.w,),

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
