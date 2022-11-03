
import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:movie_app/network/responses/api_constants.dart';
import 'package:movie_app/resources/colors.dart';

import '../resources/dimens.dart';

class ActorView extends StatelessWidget {
  final BaseActorVO? actorVO;

  ActorView(this.actorVO);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
              child: ActorImageView(actorVO?.profilePath),
          ),
          Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM),
            child: FavouriteButtonView(),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ActorNameAndLikeView(actorVO)
          ),
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  final String? imagePath;

  ActorImageView(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return (imagePath != null) ? Image.network("$IMAGE_BASE_URL${imagePath}",
    fit: BoxFit.cover,
    ) : Center(child: Icon(Icons.image_outlined,color : Colors.white38,size: 80,));
  }
}

class FavouriteButtonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Icon(
        Icons.favorite_border,
        color: Colors.white,
      )
    );
  }
}

class ActorNameAndLikeView extends StatelessWidget {
  final BaseActorVO? actorVO;

  ActorNameAndLikeView(this.actorVO);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${actorVO?.name}",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
                size: MARGIN_CARD_MEDIUM_2,
              ),
              SizedBox(width: MARGIN_MEDIUM),
              Text(
                "You Like and 13 Mores",
                style: TextStyle(
                  color: HOME_SCREEN_LSIT_TITLE_COLOR,
                  fontSize: 10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
