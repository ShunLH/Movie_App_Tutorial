import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/responses/api_constants.dart';
import 'package:movie_app/widgets/rating_view.dart';
import '../resources/dimens.dart';

class MovieView extends StatelessWidget {
  final Function(int) onTapMovie;
  final MovieVO? mMovie;

  MovieView(this.onTapMovie, this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MOVIE_LIST_ITEM_WIDTH,
            child: GestureDetector(
              onTap: () {
                onTapMovie(mMovie?.id ?? 0);
              },
              // child: Image.network("https://m.media-amazon.com/images/M/MV5BNzg1MDQxMTQ2OF5BMl5BanBnXkFtZTcwMTk3MjAzOQ@@._V1_FMjpg_UX1000_.jpg",
              child: Image.network(
                "$IMAGE_BASE_URL${mMovie?.posterPath}",
                height: MOVIE_IMAGE_HEIGHT,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            "${mMovie?.title}",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              Text(
                "${mMovie?.popularity?.round()}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: MARGIN_MEDIUM),
              RatingView(),
            ],
          ),
        ],
      ),
    );
  }
}
