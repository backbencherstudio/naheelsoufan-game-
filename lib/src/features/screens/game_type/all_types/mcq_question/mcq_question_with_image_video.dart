import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/widget/video_part.dart';

import '../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../widgets/full_screen_image_popup.dart';
import 'widget/image_part.dart';

class McqQuestionWithImageVideo extends StatelessWidget {
  final List<String> choices;
  final String question;
  final String? imageUrl;
  final String? videoUrl;
  final String? videoThumbnailUrl;
  const McqQuestionWithImageVideo({
    super.key,
    required this.choices,
    required this.question,
    this.imageUrl,
    this.videoUrl,
    this.videoThumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          question,
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),

        ///Image part\
        if (imageUrl != null) ImagePart(imageUrl: imageUrl),

        ///video part
        if (videoUrl != null) VideoPart(thumbnailUrl: videoThumbnailUrl, videoUrl: videoUrl!),

        GridView.builder(
          itemCount: choices.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3, // Wider buttons
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // Handle choice selection
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorScheme.optionBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                choices[index],
                style: textTheme.bodyLarge!.copyWith(
                  color: AppColorScheme.surface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
