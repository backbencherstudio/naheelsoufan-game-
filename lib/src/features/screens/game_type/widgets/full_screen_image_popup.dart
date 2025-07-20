import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class FullScreenImagePopup extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePopup({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      child: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                InteractiveViewer(
                  panEnabled: true,
                  minScale: 1,
                  maxScale: 4,
                  child: Image.network(imageUrl, fit: BoxFit.contain),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset('assets/icons/expandButton.svg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
