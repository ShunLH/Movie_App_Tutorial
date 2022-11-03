
import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/responses/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/gradient_view.dart';

import '../widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  Function(int) onTapBannerView;
  final MovieVO? mMovie;

  BannerView(this.mMovie,this.onTapBannerView);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        this.onTapBannerView(mMovie?.id ?? 0);
      },
      child: Stack(
        children: [
          Positioned.fill(
              child: BannerImageView(mMovie?.backDropPath),
          ),
          Positioned.fill(
            child: GradientView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: BannerTitleView(mMovie?.title),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
        ],
      ),
    );
  }
}


class BannerTitleView extends StatelessWidget {
  final String? title;

  BannerTitleView(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${this.title}",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("Official Review",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  final String? movieImgPath;

  BannerImageView(this.movieImgPath);

  @override
  Widget build(BuildContext context) {
    return Image.network("$IMAGE_BASE_URL${movieImgPath}",
    fit : BoxFit.cover,
    );
  }
}
