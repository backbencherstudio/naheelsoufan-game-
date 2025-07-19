import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../core/constant/icons.dart';
import '../../../core/constant/images.dart';
import '../../../data/riverpod/common_state_control.dart';
import '../custom_show_menu/custom_menu_card.dart';

class RegisterAppbar extends StatelessWidget {
   RegisterAppbar({super.key});

  final  menuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final dropDownStyle = Theme.of(context).textTheme.displayMedium;
    return Row(
      children: [
        SizedBox(
          height: 52.h,
          child: Image.asset(AppImages.logo),
        ),
        SizedBox(width: 95.w),
        Consumer(
          builder: (_, ref, _) {
            final isClicked = ref.watch(isClick);
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
                  color: AppColorScheme.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(AppIcons.languageIcon),
                    Text(result, style: dropDownStyle),
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
