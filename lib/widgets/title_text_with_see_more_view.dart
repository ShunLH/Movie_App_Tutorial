import 'package:flutter/material.dart';
import 'package:movie_app/widgets/see_more_text.dart';
import 'package:movie_app/widgets/title_text.dart';

class TitleTextWithSeeMoreView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreButtonVisibility;

  TitleTextWithSeeMoreView(this.titleText, this.seeMoreText,
      {this.seeMoreButtonVisibility = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(titleText),
        Spacer(),
        Visibility(
          visible: seeMoreButtonVisibility,
          child: SeeMoreText(seeMoreText),
        ),
      ],
    );
  }
}
