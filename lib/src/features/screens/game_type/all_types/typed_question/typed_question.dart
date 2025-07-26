import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/register/presentation/widget/custom_textformfield.dart';

import '../../widgets/full_screen_image_popup.dart';
import '../mcq_question/widget/image_part.dart';
import '../mcq_question/widget/video_part.dart';

class TypedQuestionWithImageVideo extends StatelessWidget {
  final String question;
  final String? imageUrl;
  final String? videoUrl;
  final String? videoThumbnailUrl;
  const TypedQuestionWithImageVideo({super.key, required this.question, this.imageUrl, this.videoUrl, this.videoThumbnailUrl});

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
        ///Image part
        if (imageUrl != null) ImagePart(imageUrl: imageUrl),

        ///video part
        if (videoUrl != null) VideoPart(thumbnailUrl: videoThumbnailUrl, videoUrl: videoUrl!),
        SizedBox(height: 17.h,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Answer', style: textTheme.bodyLarge),
            SizedBox(height: 4.h),
            CustomTextFormField(hintText: "Type your answer here"),
          ],
        ),
      ],
    );
  }
}
