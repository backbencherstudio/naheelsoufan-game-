part of 'route_import_part.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.signInScreen,
    routes: [
      // GoRoute(
      //   path: RouteName.chooseCategoryScreen,
      //   pageBuilder: (context, state) {
      //     return buildPageWithTransition(
      //       context: context,
      //       state: state,
      //       transitionType: PageTransitionType.slideRightToLeft,
      //       child: ChooseCategoryScreen(),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: RouteName.chooseDifficultyScreen,
      //   pageBuilder: (context, state) {
      //     return buildPageWithTransition(
      //       context: context,
      //       state: state,
      //       transitionType: PageTransitionType.slideRightToLeft,
      //       child: ChooseDifficultyBackground(),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: RouteName.addPlayerScreen,
      //   pageBuilder: (context, state) {
      //     return buildPageWithTransition(
      //       context: context,
      //       state: state,
      //       transitionType: PageTransitionType.slideRightToLeft,
      //       child: AddPlayerQuickGameScreen(),
      //     );
      //   },
      // ),
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
        path: RouteName.catagorySelectionScreen,
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
