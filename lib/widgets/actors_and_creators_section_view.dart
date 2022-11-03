import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:movie_app/widgets/title_text_with_see_more_view.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../viewitems/actor_view.dart';

class ActorsAndCreatorsSectionView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreButtonVisibility;
  final List<BaseActorVO>? mActorList;

  ActorsAndCreatorsSectionView(
    this.titleText,
    this.seeMoreText, {
    this.seeMoreButtonVisibility = true,
    this.mActorList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(
        top: MARGIN_MEDIUM_2,
        bottom: MARGIN_MEDIUM_2,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithSeeMoreView(
              titleText,
              seeMoreText,
              seeMoreButtonVisibility: this.seeMoreButtonVisibility,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          Container(
            height: BEST_ACTORS_HEIGHT,
            child: (this.mActorList != null)
                ? ListView.builder(
                    padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                    scrollDirection: Axis.horizontal,
                    itemCount: mActorList?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ActorView(this.mActorList?[index]);
                    })
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
