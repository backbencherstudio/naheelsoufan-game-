import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constant/icons.dart';
import '../../../data/riverpod/player_game/player_game_controller.dart';

class CustomAppBar extends ConsumerWidget {
  final String? title;
  final String? img;
  final String? icon;
  final void Function()? onTap;
  const CustomAppBar({super.key, this.title, this.img, this.onTap , this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: title != null ? Text(title!) : SizedBox.shrink(),
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: GestureDetector(
          onTap: () {
            ref.read(playerGameProvider.notifier).fetchGames();
            Navigator.pop(context);
          },
          child: SvgPicture.asset(icon ?? AppIcons.backButton),
        ),
      ),
      actions: [
        GestureDetector(onTap: onTap, child: img !=null ? Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: SvgPicture.asset(img!),
        ): SizedBox()),
      ],
    );
  }
}
