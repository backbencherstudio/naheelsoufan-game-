import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../riverpod/function.dart';

class CustomQuestionCard extends ConsumerWidget {
  final String questionId;
  final String questionLevel;
  final int questionNumber;
  final String questionCategory;
  final String iconUrl;

  const CustomQuestionCard({
    super.key,
    required this.questionId,
    required this.questionLevel,
    required this.questionNumber,
    required this.questionCategory,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickedStatus = ref.watch(isQuestionClicked(int.parse(questionId)));
    bool isClicked = ref.read(isQuestionClicked(int.parse(questionId)).notifier).state;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        return GestureDetector(
          onTap: (){
            ref.read(isQuestionClicked(int.parse(questionId)).notifier).state = !isClicked;
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 112.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: !ref.read(isQuestionClicked(int.parse(questionId)).notifier).state ? [
                          Color(0xFF1D5128),
                          Color(0xFF14BA37),
                          Color(0xFF1D5128),
                        ] : [
                          Color(0xFFF2E792),
                          Color(0xFFF8B133),
                          Color(0xFFDE712B)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 8.h,
                    ), // Padding for spacing inside the card
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(iconUrl),
                        SizedBox(height: 12.h), // Space between the icon and text
                        Text(
                          '$questionNumber Question',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFB8F1B9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: LinearGradient(colors: ref.read(isQuestionClicked(int.parse(questionId)).notifier).state ?
                      [
                        Color(0xFFF2E792),
                        Color(0xFFF8B133),
                        Color(0xFFDE712B)
                      ] : [
                        Color(0xFFB8F1B9),
                        Color(0xFFB8F1B9),
                        Color(0xFFB8F1B9),
                      ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(questionLevel, style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2E1126)
                    ),),
                  ),
                ],
              ),
              Text(
                textAlign: TextAlign.center,
                questionCategory,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
