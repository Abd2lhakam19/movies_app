import 'package:application/core/routing/routes.dart';
import 'package:application/features/home/ui/home_screen.dart';
import 'package:application/features/movie_details/movie_details.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
