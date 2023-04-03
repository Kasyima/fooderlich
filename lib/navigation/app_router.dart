import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

// AppRouter is just a wrapper around GoRouter that
// keeps your navigation code in one place.
class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;

  AppRouter(
    this.appStateManager,
    this.profileManager,
    this.groceryManager,
  );
  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/login',
    routes: [
      // Adding the Login Route
      GoRoute(
        name: 'login', // Names the route
        path: '/login', // Is the route's path

        builder: (context, state) =>
            const LoginScreen(), // Is this route's page builder.
      ),
      // Adding the Onboarding Route
      /*
      1.You can implement redirection with GoRouter.
      2.You can push or go to the onboarding route by calling context.go('/onboarding);
       */
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      //! Transitioning From Onboarding to Home
      GoRoute(
        path:
            '/:tab', // Dfns a path with thw tab parameter. The notion is a colon followed by the parameter name.
        name: 'home',
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
          return Home(
            currentTab: tab,
            key: state.pageKey,
          );
        },
        routes: [
          //! Showing the Grocery Item Screen
          GoRoute(
            path: 'item/:id',
            name: 'item',
            builder: (context, state) {
              final itemId = state.params['id'] ?? '';
              final item = groceryManager.getGroceryItem(
                itemId,
              );

              return GroceryItemScreen(
                originalItem: item,
                onCreate: (item) {
                  groceryManager.addItem(item);
                },
                onUpdate: (item) {
                  groceryManager.updateItem(item);
                },
              );
            },
          ),
          //! Navigating to the Profile Screen
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) {
              final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
              return ProfileScreen(
                user: profileManager.getUser,
                currentTab: tab,
              );
            },
            routes: [
              //! Create WebView Subroute
              GoRoute(
                path: 'rw',
                name: 'rw',
                builder: (context, state) => const WebViewScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    //!Setting Up Your Error Handler
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
        key: state.pageKey,
      );
    },
    // Handling Redirects
    redirect: (context, state) {
      final loggedIn = appStateManager.isLoggedIn;

      final loggingIn = state.subloc == '/login';

      if (!loggedIn) return loggingIn ? null : '/login';

      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.subloc == '/onboarding';

      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }

      if (loggingIn || onboarding) return '/${FooderlichTab.explore}';

      return null;
    },
  );
}
