import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import '../../../../../core/constant/icons.dart';
import '../../../account_screens/presentation/widgets/custom_music_volume_buttton.dart';
import '../../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../../../game_mode_selection_screens/riverpod/musicVisible_provider.dart';

class ClickedSettingBottom extends StatelessWidget {
  const ClickedSettingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) {
                final isVisible = ref.watch(isMusicVisibleProvider);
                return CustomMusicoffButton(
                  onTap: () {
                    ref.read(isMusicVisibleProvider.notifier).state =
                    !isVisible;
                  },
                  isSelected: isVisible,
                );
              },
            ),
            SizedBox(width: 10.w),
            CustomIconsButtons(
              icon: AppIcons.sound,
              onTap: () {},
              bgIcon: AppIcons.iconBG,
            ),
          ],
        ),
        SizedBox(height: 32.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Terms of Use ", ),
            SvgPicture.asset(AppIcons.dot),
            Text(" Privacy Policy")
          ],
        ),
        SizedBox(height: 16.h,),
        Text("Question & Answers")
      ],
    );
  }
}
