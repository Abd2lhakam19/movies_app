import 'package:application/core/helper/api_constants.dart';
import 'package:application/core/helper/app_assets.dart';
import 'package:application/features/home/data/models/new_releases_response.dart';
import 'package:application/features/movie_details/movie_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key, this.results});
  final List<Results>? results;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MovieDetails(movieId: results![index].id.toString()),
                    ));
                  },
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        ApiConstants.baseImage + results![index].posterPath!,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 36.h,
                  width: 27.w,
                  child: Image.asset(
                    AppAssets.bookMark,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const VerticalDivider(
                thickness: 2,
                color: Colors.transparent,
              ),
          itemCount: results!.length),
    );
  }
}
