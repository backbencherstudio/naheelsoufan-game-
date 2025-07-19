import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constant/icons.dart';
import '../../../core/constant/images.dart';
import '../custom_show_menu/custom_menu_card.dart';
import '../riverpod/common_state_control.dart';

class RegisterAppbar extends StatelessWidget {
   RegisterAppbar({super.key});

  final  menuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 52.h,
          child: Image.asset(AppImages.logo),
        ),
        SizedBox(width: 95.w),
        Consumer(
          builder: (_, ref, _) {
            final result = ref.watch(isSelectedVal) ?? "US English";
            return GestureDetector(
              key: menuKey,
              onTap: ()async {
                final value = await customPopupMenu(
                    context: context,key:menuKey,
                list: {"US English", "عربي   "},
                height: 150.h,
                );
                ref.read(isSelectedVal.notifier).state = value;
              },
              child: Container(
                height: 32.h,
                width: 148.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  color: Color(0xFFE0E0FF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(AppIcons.languageIcon),
                    Text(result, style: TextStyle(color: Color(0xFF3D4279)),),
                    SvgPicture.asset(AppIcons.dropdownIcon)
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
