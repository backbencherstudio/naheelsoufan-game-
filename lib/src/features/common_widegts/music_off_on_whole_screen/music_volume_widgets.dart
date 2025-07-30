import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/icons.dart';
import '../../screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_MusicOff_Button.dart';
import 'riverpod/musicVisible_provider.dart';

class MusicOffOnWholePage extends StatelessWidget {
  const MusicOffOnWholePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final isVisible = ref.watch(isMusicVisibleProvider);
            return CustomOnOffButton(
              onTap: () {
                ref.read(isMusicVisibleProvider.notifier).state =
                !isVisible;
              },
              isSelected: isVisible,
            );
          },
        ),
        SizedBox(width: 10.w),
        Consumer(
          builder: (_, ref, _) {
            final isVisible = ref.watch(isVolumeVisibleProvider);
            return CustomOnOffButton(
              picture: SvgPicture.asset(AppIcons.volumeIcon),
              pictureBg: SvgPicture.asset(AppIcons.greenBtnBg),
              onTap: () {
                ref.read(isVolumeVisibleProvider.notifier).state =
                !isVisible;
              },
              isSelected: isVisible,
            );
          },
        ),
      ],
    );
  }
}