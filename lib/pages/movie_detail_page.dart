import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/widgets/actors_and_creators_section_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';

import '../widgets/rating_view.dart';
import '../widgets/title_text.dart';

class MovieDetailsPage extends StatelessWidget {
  final List<String> genreList = ["Action", "Adventure", "Thriller"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailSliverAppBarView(
                () => Navigator.pop(context),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2,
                    ),
                    child: TrailerSection(genreList),
                  ),
                  SizedBox(
                    height: MARGIN_LARGE,
                  ),
                  ActorsAndCreatorsSectionView(
                    MOVIE_DETAIL_SCREEN_ACTORS_TITLE,
                    "",
                    seeMoreButtonVisibility: false,
                  ),
                  SizedBox(
                    height: MARGIN_LARGE,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,),
                    child: AboutFlimSectionView(),
                  ),
                  SizedBox(
                    height: MARGIN_LARGE,
                  ),
                  ActorsAndCreatorsSectionView(
                    MOVIE_DETAIL_SCREEN_CREATORS_TITLE,
                    MOVIE_DETAIL_SCREEN_CREATORS_SEE_MORE,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutFlimSectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("ABOUT FLIM"),
        SizedBox(height: MARGIN_MEDIUM_2,),
        AboutFlimInfoView(
          "Original Title:",
          "Fantastic Beasts: The Secrets of Dumbledore",
        ),
        SizedBox(height: MARGIN_MEDIUM_2,),
        AboutFlimInfoView(
          "Type",
          "Action, Adventure, Thriller",
        ),
        SizedBox(height: MARGIN_MEDIUM_2,),
        AboutFlimInfoView(
          "Production:",
          "United Kingdonm, USA",
        ),
        SizedBox(height: MARGIN_MEDIUM_2,),
        AboutFlimInfoView(
          "Premiere:",
          "8 November 2016(World)",
        ),
        SizedBox(height: MARGIN_MEDIUM_2,),
        AboutFlimInfoView(
          "Description:",
          "Fantastic Beasts: The Secrets of Dumbledore is a 2022 fantasy film directed by David Yates from a screenplay by J. K. Rowling and Steve Kloves. The sequel to Fantastic Beasts: The Crimes of Grindelwald (2018), it is the third instalment in the Fantastic Beasts film series and the eleventh overall in the Wizarding World franchise. ",
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
        SizedBox(
          width: MARGIN_CARD_MEDIUM_2,
        ),
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
  final List<String> genreList;
  TrailerSection(this.genreList);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreView(genreList),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        StoryLineView(),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Row(
          children: [
            MovieDetailScreenButtonView(
                "PLAY TRAILER",
                PLAY_BUTTON_COLOR,
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.black54,
                )),
            SizedBox(width: MARGIN_CARD_MEDIUM_2),
            MovieDetailScreenButtonView(
              "RATE MOVIE",
              HOME_SCREEN_BACKGROUND_COLOR,
              Icon(
                Icons.star,
                color: PLAY_BUTTON_COLOR,
              ),
              isGhostButton: true,
            ),
          ],
        ),
      ],
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
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
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
  const StoryLineView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(MOVIE_DETAIL_SCREEN_STORYLINE_TITLE),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald's growing legion of followers.",
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

  MovieTimeAndGenreView(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: PLAY_BUTTON_COLOR,
        ),
        SizedBox(width: MARGIN_SMALL),
        Text(
          "2hr 30min",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Row(
          children: genreList.map((genre) => GenreChipView(genre)).toList(),
        ),
        Spacer(),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          backgroundColor: MOVIE_DETAIL_SCREEN_CHIP_BACKGROUND_COLOR,
          label: Text(
            genreText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_SMALL,
        ),
      ],
    );
  }
}

class MovieDetailSliverAppBarView extends StatelessWidget {
  final Function onTapBack;
  MovieDetailSliverAppBarView(this.onTapBack);
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
              child: MovieDetailAppBarImageVIew(),
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
                child: BackButtonView( () => onTapBack()),
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
                child: MovieDetailAppBarInfoView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MovieDetailsYearView(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(height: MARGIN_SMALL),
                    TitleText("38876 VOTES"),
                    SizedBox(
                      height: MARGIN_CARD_MEDIUM_2,
                    )
                  ],
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "9,76",
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
          "The Secrets of Dumbledore",
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
  const MovieDetailsYearView({
    Key? key,
  }) : super(key: key);

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
          "2016",
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
  const SearchButtonView({
    Key? key,
  }) : super(key: key);

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
      onTap: (){
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
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cms.dmpcdn.com/moviearticle/2022/04/13/56fb4fc0-bb49-11ec-8f2e-f393db1d7b77_webp_original.jpg",
      fit: BoxFit.cover,
    );
  }
}
