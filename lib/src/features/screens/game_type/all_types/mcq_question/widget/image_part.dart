import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/full_screen_image_popup.dart';

class ImagePart extends StatelessWidget {
  const ImagePart({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: 40.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth*0.8,
                height: screenHeight*0.3,
                child: Image.network(imageUrl!, fit: BoxFit.fill),
              ),
              Positioned(
                right: 10.w,
                top: 10.h,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) =>
                          FullScreenImagePopup(imageUrl: imageUrl!),
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
    );
  }
}
