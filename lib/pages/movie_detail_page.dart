import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/responses/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/widgets/actors_and_creators_section_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/rating_view.dart';
import '../widgets/title_text.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;
  MovieDetailsPage(this.movieId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MovieModelImpl>(
        builder: (context,widget,model){
          return Container(
            color: HOME_SCREEN_BACKGROUND_COLOR,
            child: (model.mMovie != null)
                ? CustomScrollView(
              slivers: [
                MovieDetailSliverAppBarView(
                      () => Navigator.pop(context),
                  model.mMovie,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                        child: TrailerSection(model.mMovie),
                      ),
                      SizedBox(height: MARGIN_LARGE),
                      ActorsAndCreatorsSectionView(
                        MOVIE_DETAIL_SCREEN_ACTORS_TITLE,
                        "",
                        mActorList: model.mActors,
                        seeMoreButtonVisibility: false,
                      ),
                      SizedBox(height: MARGIN_LARGE),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                        child: AboutFlimSectionView(model.mMovie),
                      ),
                      SizedBox(height: MARGIN_LARGE),
                      (model.mCreatorsList != null && model.mCreatorsList!.isNotEmpty)
                          ? ActorsAndCreatorsSectionView(
                        MOVIE_DETAIL_SCREEN_CREATORS_TITLE,
                        MOVIE_DETAIL_SCREEN_CREATORS_SEE_MORE,
                        mActorList: model.mCreatorsList,
                      )
                          : Container(),
                    ],
                  ),
                ),
              ],
            )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

}
/*
class _MovieDetailsPageState extends State<MovieDetailsPage> {
  // MovieModel? mMovieModel = MovieModelImpl();
  // MovieVO? mMovie;
  // List<CreditVO>? mActorsList;
  // List<CreditVO>? mCreatorsList;

  @override
  void initState() {
    super.initState();
    print("movie id ===> ${widget.movieId}");

    /*
    ///MovieDetail
    mMovieModel?.getMovieDetails(widget.movieId)?.then((movie) {
      setState(() {
        this.mMovie = movie;
      });
    });

    ///MovieDetail Database
    mMovieModel?.getMovieDetailsFromDatabase(widget.movieId)?.then((movie) {
      setState(() {
        this.mMovie = movie;
      });
    });

    mMovieModel?.getCreditsByMovie(widget.movieId)?.then((creditsList) {
      setState(() {
        this.mActorsList =
            creditsList.where((credit) => credit.isActor()).toList();
        this.mCreatorsList =
            creditsList.where((credit) => credit.isCreator()).toList();
      });
    });
    */

  }


}
 */

class AboutFlimSectionView extends StatelessWidget {
  final MovieVO? mMovie;
  AboutFlimSectionView(this.mMovie);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(ABOUT_FILM_TITLE),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimInfoView(
          "Original Title:",
          "${mMovie?.originalTitle}",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimInfoView(
            "Type", mMovie?.genres?.map((genre) => genre.name).join(",") ?? ""),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimInfoView(
          "Production:",
          mMovie?.productionCountries
                  ?.map((country) => country.name)
                  .join(",") ??
              "",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimInfoView(
          "Premiere:",
          mMovie?.releaseDate ?? "",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimInfoView(
          "Description:",
          mMovie?.overview ?? "",
        ),
      ],
    );
  }
}

class AboutFlimInfoView extends StatelessWidget {
  final String label;
  final String description;

  AboutFlimInfoView(this.label, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            label,
            style: TextStyle(
              color: MOVIE_DETAIL_INFO_TEXT_COLOR,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class TrailerSection extends StatelessWidget {
  final MovieVO? mMovie;
  TrailerSection(this.mMovie);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieTimeAndGenreView(
            genreList:
                mMovie?.genres?.map((genre) => genre.name ?? "").toList() ?? [],
          ),
          SizedBox(height: MARGIN_MEDIUM_3),
          StoryLineView(mMovie?.overview),
          SizedBox(height: MARGIN_MEDIUM_2),
          Row(
            children: [
              MovieDetailScreenButtonView("PLAY TRAILER", PLAY_BUTTON_COLOR,
                  Icon(Icons.play_circle_fill, color: Colors.black54)),
              SizedBox(width: MARGIN_CARD_MEDIUM_2),
              MovieDetailScreenButtonView(
                "RATE MOVIE",
                HOME_SCREEN_BACKGROUND_COLOR,
                Icon(Icons.star, color: PLAY_BUTTON_COLOR),
                isGhostButton: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MovieDetailScreenButtonView extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Icon buttonIcon;
  final bool isGhostButton;
  MovieDetailScreenButtonView(this.title, this.backgroundColor, this.buttonIcon,
      {this.isGhostButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
        border: (isGhostButton)
            ? Border.all(
                color: Colors.white,
                width: 2,
              )
            : null,
      ),
      child: Center(
        child: Row(
          children: [
            buttonIcon,
            SizedBox(width: MARGIN_MEDIUM),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLineView extends StatelessWidget {
  final String? overView;
  StoryLineView(this.overView);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(MOVIE_DETAIL_SCREEN_STORYLINE_TITLE),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "${this.overView}",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
      ],
    );
  }
}

class MovieTimeAndGenreView extends StatelessWidget {
  final List<String> genreList;

  MovieTimeAndGenreView({required this.genreList});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        spacing: MARGIN_MEDIUM,
        children: _createMovieTimeAndGenreWidget());
  }

  List<Widget> _createMovieTimeAndGenreWidget() {
    List<Widget> widgets = [
      Icon(Icons.access_time, color: PLAY_BUTTON_COLOR),
      SizedBox(width: MARGIN_SMALL),
      Text(
        "2hr 30min",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: MARGIN_MEDIUM),
    ];
    widgets.addAll(genreList.map((genre) => GenreChipView(genre)).toList());
    widgets.add(Icon(
      Icons.favorite_border,
      color: Colors.white,
    ));
    return widgets;
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: MOVIE_DETAIL_SCREEN_CHIP_BACKGROUND_COLOR,
      label: Text(
        genreText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MovieDetailSliverAppBarView extends StatelessWidget {
  final Function onTapBack;
  final MovieVO? mMovie;
  MovieDetailSliverAppBarView(this.onTapBack, this.mMovie);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAIL_SCREEN_SLIVER_APP_BAR_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailAppBarImageVIew(mMovie?.backDropPath ?? ""),
            ),
            Positioned.fill(
              child: GradientView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MARGIN_XXLARGE,
                  left: MARGIN_MEDIUM_2,
                ),
                child: BackButtonView(() => onTapBack()),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MARGIN_XXLARGE + MARGIN_MEDIUM,
                  right: MARGIN_MEDIUM_2,
                ),
                child: SearchButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  bottom: MARGIN_LARGE,
                ),
                child: MovieDetailAppBarInfoView(mMovie),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  final MovieVO? mMovie;
  MovieDetailAppBarInfoView(this.mMovie);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MovieDetailsYearView(mMovie?.releaseDate?.substring(0, 4)),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(height: MARGIN_SMALL),
                    TitleText("${mMovie?.voteCount} VOTES"),
                    SizedBox(
                      height: MARGIN_CARD_MEDIUM_2,
                    )
                  ],
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "${mMovie?.voteAverage}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MOVIE_DETAIL_RATING_TEXT_SIZE,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "${mMovie?.title}",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_HEADING_2X,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class MovieDetailsYearView extends StatelessWidget {
  final String? mYear;
  MovieDetailsYearView(this.mYear);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
        color: PLAY_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
      ),
      child: Center(
        child: Text(
          "$mYear",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: Colors.white,
      size: MARGIN_XLARGE,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;
  BackButtonView(this.onTapBack);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapBack();
      },
      child: Container(
          width: MARGIN_XXLARGE,
          height: MARGIN_XXLARGE,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: MARGIN_XLARGE,
          )),
    );
  }
}

class MovieDetailAppBarImageVIew extends StatelessWidget {
  final String movieImage;
  MovieDetailAppBarImageVIew(this.movieImage);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL${movieImage}",
      fit: BoxFit.cover,
    );
  }
}
