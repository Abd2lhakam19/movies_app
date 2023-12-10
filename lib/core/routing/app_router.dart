import 'package:application/app_layout.dart';
import 'package:application/core/routing/routes.dart';
import 'package:application/features/movie_details/movie_details.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (context) => const AppLayout(),
        );
      case Routes.movieDetails:
        return MaterialPageRoute(
          builder: (context) => MovieDetails(
            movieId: args as String,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Not Found"),
            ),
          ),
        );
    }
  }
}
