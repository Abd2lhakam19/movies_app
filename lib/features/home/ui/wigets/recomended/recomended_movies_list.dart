import 'package:application/features/home/ui/wigets/recomended/movie_list_item.dart';
import 'package:flutter/material.dart';

class RecomendedMoviesList extends StatelessWidget {
  const RecomendedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const MovieListItem(),
          separatorBuilder: (context, index) => const VerticalDivider(
                thickness: 2,
                color: Colors.transparent,
              ),
          itemCount: 10),
    );
  }
}
