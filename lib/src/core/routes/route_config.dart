part of 'route_import_part.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.questionAnswerScreen,
    routes: [
      GoRoute(
        path: RouteName.chooseCategoryScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ChooseCategoryScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.gridDifficultyLevelScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: GridDifficultyLevelScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.enterTeamNameScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: EnterTeamNameScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.freeModeScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: FreeModeScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.clickedSettingScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ClickedSettingScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.questionAnswerScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: QuestionAnswerScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.difficultyLevelScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: DeficultyLevelScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.registerScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: RegisterScreen(),
          );
        },
      ),



 GoRoute(
        path: RouteName.choosePaymentCard,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ChoosePaymentCard(),
          );
        },
      ),

 GoRoute(
        path: RouteName.paymentScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: PaymentScreen(),
          );
        },
      ),

 GoRoute(
        path: RouteName.leaderboardScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: LeaderboardScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.editProfileScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: EditProfileScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.profileIconScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ProfileIconScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.choosePaymentCard,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ChoosePaymentCard(),
          );
        },
      ),

      GoRoute(
        path: RouteName.paymentScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: PaymentScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.addSelectionScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: AddPlayerScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.nextTurnScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: NextTurnScreen(),
          );
        },
      ),



      GoRoute(
        path: RouteName.signInScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: SignInScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.forgetPasswordScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ForgotPassScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.forgetPasswordLinkSentScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ForgotLinkScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.gameModeScreens,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: GameModeScreens(),
          );
        },
      ),
      GoRoute(
        path: RouteName.freeGameScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: FreeGameScreen(),
          );
        },
      ),
        GoRoute(
        path: RouteName.createRoomScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: CreateRoomScreen(),
          );
        },
      ),
       GoRoute(
        path: RouteName.shareRoomScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ShareRoomScreen(),
          );
        },
      ),
     GoRoute(
        path: RouteName.modeSelectionScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ModeSelectionScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.deficultyLevelScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: DeficultyLevelScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.playerSelectionScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: PlayerSelectionScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.questionAnswerScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: QuestionAnswerScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.quizScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: QuizScreen(),
          );
        },
      ),
  GoRoute(
        path: RouteName.categorySelectionScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: CatagorySelectionScreen(),
          );
        },
      ),
    ],
  );
}