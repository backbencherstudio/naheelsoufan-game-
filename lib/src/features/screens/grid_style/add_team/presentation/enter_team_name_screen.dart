import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/special_elevated_button003/special_elevated_button003.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/add_team/presentation/widget/custom_team_formfield.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/constant/images.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../data/repository/player/select_player_service.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';

class EnterTeamNameScreen extends ConsumerStatefulWidget {
  const EnterTeamNameScreen({super.key});

  @override
  ConsumerState<EnterTeamNameScreen> createState() => _EnterTeamNameScreenState();
}

class _EnterTeamNameScreenState extends ConsumerState<EnterTeamNameScreen> {
  late TextEditingController nameController1;
  late TextEditingController nameController2;
  @override
  void initState() {
    nameController1 = TextEditingController(text: "team 1");
    nameController2 = TextEditingController(text: "team 2");
    super.initState();
  }

  @override
  void dispose() {
    nameController1.dispose();
    nameController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                  CustomIconsButtons(icon: AppIcons.settings, onTap: () {}),
                ],
              ),
              SizedBox(height: 105.h),
              Text("Enter Team Name", style: textTheme.headlineMedium),
              SizedBox(height: 32.h),
              CustomTeamFormField(
                controller: nameController1,
                hintText: "Type team name",
                teamNo: '1',
              ),
              SizedBox(height: 4.h),
              Text("VS", style: textTheme.titleLarge),
              SizedBox(height: 4.h),
              CustomTeamFormField(
                controller: nameController2,
                hintText: "Type team name",
                teamNo: '2',
              ),
              SizedBox(height: 100.h),
              SpecialElevatedButton003(
                buttonName: 'NEXT',
                onTap: () async {

                  final playerNameList = [nameController1.text, nameController2.text];

                  final selectPlayers = SelectPlayersService();
                  final result = await selectPlayers.selectPlayers(context: context, players: playerNameList);
                  if (result?.success == true) {
                    ref.read(playerListProvider.notifier).state = result;
                    context.pushReplacement(
                      RouteName.chooseCategoryScreen,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result?.message ?? "Teams added successful", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                    );
                    context.push(RouteName.gridCategoryScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result?.message ?? "Something went wrong", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
