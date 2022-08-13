
import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';

import '../resources/dimens.dart';

class ActorView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
              child: ActorImageView(),
          ),
          Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM),
            child: FavouriteButtonView(),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ActorNameAndLikeView()
          ),
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  const ActorImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network("https://i.guim.co.uk/img/media/43d0040f4f6c335cbba2468c7bbb44f1a87e7b86/0_448_3511_2106/master/3511.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=394814dd48d430d3f2c1ed2dca416497",
    fit: BoxFit.cover,
    );
  }
}

class FavouriteButtonView extends StatelessWidget {
  const FavouriteButtonView({
    Key? key,
  }) : super(key: key);

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
  const ActorNameAndLikeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Park Seo Joon",
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
                "YOU LIKE 15 MOVIES",
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
