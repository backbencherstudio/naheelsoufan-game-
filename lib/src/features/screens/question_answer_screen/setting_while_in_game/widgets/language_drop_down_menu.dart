import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/utils/utils.dart';
import '../riverpod/chceking.dart';
import 'custom_menu.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({
    super.key,
    required GlobalKey<State<StatefulWidget>> menuKey, this.width,
  }) : _menuKey = menuKey;

  final GlobalKey<State<StatefulWidget>> _menuKey;
  final double? width;


  @override
  Widget build(BuildContext context) {
    final isNotTab = Utils.isTablet(context);
    return SizedBox(
      height: isNotTab ? 36.h : 50.h,
      width: 148.w,
      child: Consumer(
        builder: (_, ref, __) {
          final dropText = ref.watch(result) ?? "US English";
          return GestureDetector(
            key: _menuKey,
            onTap: () async {
              final value = await customPopupMenu(
                context: context,
                key: _menuKey,
                list: {"US English", "عربي"},
                height: 150.h,
                width: width
              );
              ref.read(result.notifier).state = value;
            },
            child: Container(
              height: 36.h,
              width: 148.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: Color(0xFFE0E0FF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(AppIcons.languageIcon),
                  Text(
                    dropText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Color(0xff3D4279),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(AppIcons.dropdownIcon),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
