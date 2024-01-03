import 'package:food_app/common/widgets/header.dart';
import 'package:food_app/screens/auth/forgot_password.dart';
import 'package:food_app/screens/auth/login.dart';
import 'package:food_app/screens/auth/signup.dart';
import 'package:food_app/screens/cart/cart.dart';
import 'package:food_app/screens/error/error_page.dart';
import 'package:food_app/screens/favorites/favorites.dart';
import 'package:food_app/screens/home/home.dart';
import 'package:food_app/screens/home/home_detail.dart';
import 'package:food_app/screens/profile/profile.dart';
import 'package:food_app/screens/shop/Shop.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');

final GlobalKey<NavigatorState> _shopShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shop');

final GlobalKey<NavigatorState> _cartShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'cart');

final GlobalKey<NavigatorState> _favShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'fav');

final GlobalKey<NavigatorState> _profileShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  errorBuilder: (context, state) => ErrorPage(state.error.toString()),
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/forgotpassword',
      name: 'forgot password',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotPassword();
      },
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (BuildContext context, GoRouterState state) {
        return const Signup();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return Header(
          title: "Home",
          isShowBottomTab: true,
          isShowHeader: !state.matchedLocation.contains('home'),
          child: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _homeShellNavigatorKey,
          routes: [
            GoRoute(
              name: 'home',
              parentNavigatorKey: _homeShellNavigatorKey,
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Home(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _homeShellNavigatorKey,
              path: '/home/details',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeDetail(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shopShellNavigatorKey,
          routes: [
            GoRoute(
              name: 'shop',
              parentNavigatorKey: _shopShellNavigatorKey,
              path: '/shop',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Shop(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _cartShellNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _cartShellNavigatorKey,
              path: '/cart',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Cart(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileShellNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _profileShellNavigatorKey,
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Profile(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _favShellNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _favShellNavigatorKey,
              path: '/favourite',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Favorites(),
              ),
            )
          ],
        )
      ],
    )
  ],
);


// routes: <RouteBase>[
//     ShellRoute(
//       navigatorKey: _shellNavigatorKey,
//       builder: (BuildContext context, GoRouterState state, child) {
//         return Header(
//           title: state.name ?? "Home",
//           isShowBottomTab: true,
//           child: child,
//         );
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           parentNavigatorKey: _shellNavigatorKey,
//           path: '/home',
//           name: 'home',
//           pageBuilder: (BuildContext context, GoRouterState state) =>
//               const NoTransitionPage(
//             child: Home(),
//           ),
//         ),
//         GoRoute(
//           pageBuilder: (BuildContext context, GoRouterState state) =>
//               const NoTransitionPage(
//             child: Shop(),
//           ),
//           parentNavigatorKey: _shellNavigatorKey,
//           path: '/shop',
//           name: 'shop',
//         )
//       ],
//     ),
//     GoRoute(
//       parentNavigatorKey: _rootNavigatorKey,
//       name: 'Login',
//       path: '/login',
//       builder: (BuildContext context, GoRouterState state) {
//         return const Login();
//       },
//     ),
//     GoRoute(
//       parentNavigatorKey: _rootNavigatorKey,
//       name: 'Signup',
//       path: '/signup',
//       builder: (BuildContext context, GoRouterState state) {
//         return const Signup();
//       },
//     ),
//     GoRoute(
//       parentNavigatorKey: _rootNavigatorKey,
//       name: 'Forgot password',
//       path: '/forgotpassword',
//       builder: (BuildContext context, GoRouterState state) {
//         return const ForgotPassword();
//       },
//     ),
//   ],
