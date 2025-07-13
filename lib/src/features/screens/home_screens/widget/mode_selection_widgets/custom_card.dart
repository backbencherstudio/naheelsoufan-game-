import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/features/screens/home_screens/widget/home_widgets/custom_button.dart';

class CustomCard extends StatelessWidget {
  final String img;
  final String text;
  final String? secondaryImg;
  const CustomCard({super.key, required this.img,
  required this.text,  this.secondaryImg
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero, 
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(child: SvgPicture.asset(img)),
          Positioned(
            bottom: 60,
            child: CustomButton(text: text,img: secondaryImg ,onTap: () {}),
          ),
        ],
      ),
    );
  }
}
