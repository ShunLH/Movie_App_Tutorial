import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/responses/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  Function(int) onTapMovie;
  final MovieVO? mMovie;

  ShowCaseView(this.mMovie, this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Container(
        width: 300,
        // color: Colors.blue,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "$IMAGE_BASE_URL${mMovie?.backDropPath}",
                fit: BoxFit.fitHeight,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => this.onTapMovie(mMovie?.id ?? 0) ,
                child: PlayButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${mMovie?.originalTitle}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                    TitleText("${mMovie?.releaseDate}"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
