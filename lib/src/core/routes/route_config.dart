part of 'route_import_part.dart';


class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.homeScreen,

    /// Start at the splash screen
    routes: [
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) =>
      //       BottomNavBar(navigationShell: navigationShell),
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.homeScreen,
      //           builder: (context, state) => const HomeScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.searchStation,
      //           builder: (context, state) =>  SearchStation(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.profileScreen,
      //           builder: (context, state) => const ProfileScreen(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      GoRoute(
        path: RouteName.homeScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: HomeScreen(),
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

      // GoRoute(
      //   path: RouteName.allStationList,
      //   pageBuilder: (context, state) {
      //     return buildPageWithTransition(
      //       context: context,
      //       state: state,
      //       transitionType: PageTransitionType.slideRightToLeft,
      //       child: AllStationList(),
      //     );
      //   },
      // ),

    ],
  );
}
