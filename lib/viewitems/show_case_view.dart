import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({Key? key}) : super(key: key);

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
              child: Image.network("https://m.media-amazon.com/images/M/MV5BNzg1MDQxMTQ2OF5BMl5BanBnXkFtZTcwMTk3MjAzOQ@@._V1_FMjpg_UX1000_.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: PlayButtonView(),
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
                      "Passengers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MARGIN_MEDIUM,),
                    TitleText("15 DECEMBER 2016"),
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
