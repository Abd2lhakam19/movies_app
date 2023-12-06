import 'package:flutter/material.dart';

import '../../../../../core/theming/text_styles.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key});

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
              "Dora and the lost city of gold",
              style: TextStyles.font14WhiteRegular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "2019  PG-13  2h 7m",
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
