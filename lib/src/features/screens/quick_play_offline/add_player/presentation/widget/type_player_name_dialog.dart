import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/player_provider.dart';

void showNameDialog(BuildContext context, WidgetRef ref, TextEditingController controller, int index) {
  final style = Theme.of(context).textTheme;

  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 337.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColorScheme.listContainerColor,
                  width: 2,
                ),
                color: AppColorScheme.secondary,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type Player Name',
                    style: style.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const Divider(color: Colors.white),
                  SizedBox(height: 32.h),
                  Text(
                    'Player ${index + 1}',
                    style: style.bodyMedium?.copyWith(
                      color: AppColorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: controller,
                    style: style.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Player Name',
                      hintStyle: style.bodyMedium?.copyWith(
                        color: AppColorScheme.primaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: AppColorScheme.primary,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: 'Confirm',
                      onTap: () {
                        final newName = controller.text.trim();
                        if (newName.isNotEmpty) {
                          ref.read(playerNameProvider.notifier).updatePlayerName(index, newName);
                        }
                        controller.clear();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
