import 'package:flutter/material.dart';
import 'package:flymate/feature/auth/presentation/view/sign_in_page.dart';
import 'package:flymate/feature/flight_search_result/presentation/view/flight_search_result_page.dart';
import 'package:go_router/go_router.dart';

import '../../feature/flight_details/presentation/view/flight_details_page.dart';
import '../../feature/home/presentation/view/home_page.dart';
import '../../feature/splash_page/presentation/view.dart';
import '../../feature/airport_search/presentation/view/airport_search_page.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, __) => SplashPage()),
      GoRoute(path: '/auth', builder: (_, __) => SignInPage()),
      GoRoute(path: '/home', builder: (_, __) => const HomePage()),
      GoRoute(
        path: '/airport-search',
        builder: (_, __) => const AirportSearchPage(),
      ),
      GoRoute(
        path: '/search-page',
        builder: (_, __) => const FlightSearchResultPage(),
      ),
      GoRoute(
        path: '/details-page',
        builder: (_, __) => const FlightDetailsPage(),
      ),
      GoRoute(path: '/sign-up-page', builder: (_, __) => const SignInPage()),
    ],
  );
}
