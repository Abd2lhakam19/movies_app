import 'package:application/core/routing/app_router.dart';
import 'package:application/movies_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MoviesApp(
    appRouter: AppRouter(),
  ));
}
