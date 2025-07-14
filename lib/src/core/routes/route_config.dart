part of 'route_import_part.dart';


class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.gameModeScreens,

    routes: [

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
        path: RouteName.questionAnswersScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: QuestionAnswersScreen(),
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

     

    ],
  );
}
