import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../riverpod/player_selection_name_provider.dart';
import '../home_widgets/custom_button.dart';

void showSelectionNameDialog(
  BuildContext context,
  WidgetRef ref,
  int playerIndex,
  String currentName,
) {
  final style = Theme.of(context).textTheme;
  final TextEditingController nameController = TextEditingController(
    text: currentName,
  );

  late StateProvider<String> playerProvider;
  switch (playerIndex) {
    case 1:
      playerProvider = playerSelectionProvider1;
      break;
    case 2:
      playerProvider = playerSelectionProvider2;
      break;
    case 3:
      playerProvider = playerSelectionProvider3;
      break;
    case 4:
      playerProvider = playerSelectionProvider4;
      break;
    default:
      playerProvider = playerSelectionProvider1;
  }
  if (currentName.isNotEmpty) {
    nameController.text = currentName;
  }

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
                    'Player $playerIndex',
                    style: style.bodyMedium?.copyWith(
                      color: AppColorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: nameController,
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
                        final newName = nameController.text.trim();
                        if (newName.isNotEmpty) {
                          ref.read(playerProvider.notifier).state = newName;
                        }
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
