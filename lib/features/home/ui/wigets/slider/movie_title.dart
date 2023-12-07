import 'package:application/features/home/data/models/popular_response.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/text_styles.dart';

class MovieTitle extends StatelessWidget {
  MovieTitle({super.key, this.results});
  Results? results;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              results!.title ?? "",
              style: TextStyles.font14WhiteRegular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              results!.releaseDate ?? "",
              style: TextStyles.font10LightergreyRegular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
