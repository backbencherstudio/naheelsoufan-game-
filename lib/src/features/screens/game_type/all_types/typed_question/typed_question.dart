import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/full_screen_image_popup.dart';

class TypedQuestion extends StatelessWidget {
  final String question;
  final String? image;
  const TypedQuestion({super.key, required this.question, this.image});

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
        image !=null ?
        Column(
          children: [
            SizedBox(height: 40.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Stack(
                children: [
                  SizedBox(
                    width: 345.w,
                    height: 133.h,
                    child: Image.network(image!, fit: BoxFit.fill),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.h,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => FullScreenImagePopup(imageUrl: image!),
                        );
                      },
                      child: SvgPicture.asset('assets/icons/expandButton.svg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ): const SizedBox(height: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Answer', style: textTheme.bodyLarge),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your answer',
                contentPadding: EdgeInsetsGeometry.symmetric(
                  horizontal: 12.w,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
