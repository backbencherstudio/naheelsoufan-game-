import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import '../../../../../core/constant/icons.dart';
import '../riverpod/scroll_notifier_provider.dart';
import '../widgets/primary_button.dart';
import '../widgets/player_container.dart';

class QuestionAnswersScreen extends ConsumerStatefulWidget {
  const QuestionAnswersScreen({super.key});

  @override
  _QuestionAnswersScreenState createState() => _QuestionAnswersScreenState();
}

class _QuestionAnswersScreenState extends ConsumerState<QuestionAnswersScreen> {
  final ScrollController _scrollController = ScrollController();
  String selectedCountry = '';
  String selectedPlayer = '';
  final List<String> countries = [
    'Bangladesh',
    'China',
    'Australia',
    'United States',
  ];

  void _selectCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  final List<Map<String, dynamic>> players = [
    {'name': 'Player 1', 'points': 50},
    {'name': 'Player 2', 'points': 150},
    {'name': 'Player 3', 'points': 50},
    {'name': 'Player 4', 'points': 100},
  ];

  void _selectPlayer(String player) {
    setState(() {
      selectedPlayer = player;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // Use ref.read() to update the scroll position
      ref.read(scrollPositionProvider.notifier).updateScrollPosition(_scrollController.position.pixels);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CreateScreen(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xffBA1A1A),
                              width: 3,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.cancelSvg,
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                    ),
                    ClockWidgets(text: '60', color: Color(0xffB8F1B9).withValues(alpha: 0.1),),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        AppIcons.threeDotSvg,
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 37.h,
                  width: 116.w,
                  decoration: BoxDecoration(
                    color: Color(0xffE0E0FF),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Text(
                      '100 Points',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto Flex',
                        color: Color(0xff3D4279),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: 360.w,
                  height: 130.h,
                  child: Text(
                    'Which Country has the highest population?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto Flex',
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 3.2,
                      ),
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        return PrimaryButton(
                          text: countries[index],
                          isSelected: selectedCountry == countries[index],
                          onTap: () => _selectCountry(countries[index]),
                        );
                      },
                    ),
                    SizedBox(height: 40.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final scrollPosition = ref.watch(scrollPositionProvider);
                            return Scrollbar(
                              controller: _scrollController,
                              thumbVisibility: true,
                              thickness: 10,
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: 361.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xff464C92),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 8.h,
                                      bottom: 18.h,
                                      left: 8.w,
                                    ),
                                    child: SizedBox(
                                      height: 104.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: players.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 4.w,
                                            ),
                                            child: PlayerContainer(
                                              name: players[index]['name'],
                                              points: players[index]['points'],
                                              isSelected: selectedPlayer == players[index]['name'],
                                              onTap: () => _selectPlayer(players[index]['name']),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Question 01/15',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto Flex',
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  }
}

class ClockWidgets extends StatelessWidget {
  const ClockWidgets({
    super.key, required this.text, required this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 94.h,
          width: 94.w,
          decoration: BoxDecoration(
            color: color ?? Color(0xffB8F1B9).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        SvgPicture.asset(AppIcons.stopWatchSvg),
        Positioned(
          child: Text(
            text,
            style: GoogleFonts.robotoFlex(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
