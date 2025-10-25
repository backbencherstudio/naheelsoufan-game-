import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/full_screen_video_popup.dart';


class VideoPart extends StatelessWidget {
  const VideoPart({
    super.key,
    this.thumbnailUrl,
    required this.videoUrl,
  });

  final String? thumbnailUrl;
  final String videoUrl;

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
            alignment: Alignment.center,
            children: [
              // Video thumbnail
              SizedBox(
                width: screenWidth*0.8,
                height: screenHeight*0.3,
                child: Image.network(
                  thumbnailUrl ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Center(child: Icon(Icons.broken_image)),
                ),
              ),

              // Expand/play icon button
              Positioned(
                right: 30.w,
                top: 10.h,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => FullScreenVideoPopup(videoUrl: videoUrl),
                    );
                  },
                  child: SvgPicture.asset('assets/icons/expandButton.svg'),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => FullScreenVideoPopup(videoUrl: videoUrl),
                    );
                  },
                  child: Center(child: Icon(Icons.play_circle_fill,size: 40,))
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
