import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/special_elevated_button003/special_elevated_button003.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/custom_team_formfield.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/routes/route_name.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

class EnterTeamNameScreen extends StatelessWidget {
  const EnterTeamNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController1 = TextEditingController();
    final nameController2 = TextEditingController();
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
                    CustomIconsButtons(icon: AppIcons.backIcons, onTap: () {Navigator.pop(context);}),
                    Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                    CustomIconsButtons(icon: AppIcons.settings, onTap: () {}),
                  ]
              ),
              SizedBox(height: 105.h,),
              Text("Enter Teams Name", style: textTheme.headlineMedium,),
              SizedBox(height: 32.h,),
              CustomTeamFormField(controller: nameController1, hintText: "Type team name", teamNo: '1',),
              SizedBox(height: 4.h,),
              Text("VS", style: textTheme.titleLarge,),
              SizedBox(height: 4.h,),
              CustomTeamFormField(controller: nameController2, hintText: "Type team name", teamNo: '2',),
              SizedBox(height: 100.h,),
              SpecialElevatedButton003(buttonName: 'NEXT', onTap: () {
                context.push(RouteName.chooseCategoryScreen);
              },)
              // ElevatedButton(onPressed: (){
              //   context.push(RouteName.chooseCategoryScreen);
              // }, child: Text("click")),
            ],
          ),
        ),
      ),
    );
  }
}
