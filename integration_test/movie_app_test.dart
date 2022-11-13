
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:movie_app/data/vos/collection_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/date_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/production_companies_vo.dart';
import 'package:movie_app/data/vos/production_countries_vo.dart';
import 'package:movie_app/data/vos/spoken_languages_vo.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/persistance/hive_constants.dart';

import 'test_data/test_data.dart';

void main() async{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ActorVOAdapter());
  Hive.registerAdapter(BaseActorVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(CreditVOAdapter());
  Hive.registerAdapter(DateVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ProductionCompaniesVOAdapter());
  Hive.registerAdapter(ProductionCountriesVOAdapter());
  Hive.registerAdapter(SpokenLanguagesVOAdapter());

  await Hive.openBox<ActorVO>(BOX_NAME_ACTOR_VO);
  await Hive.openBox<MovieVO>(BOX_NAME_MOVIE_VO);
  await Hive.openBox<GenreVO>(BOX_NAME_GENRE_VO);

  testWidgets("Tap Best Popular movies and Navigate to Details", (widgetTester) async{
    await widgetTester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.byType(HomePage),findsOneWidget);
    expect(find.text(TEST_DATA_MOVIE_NAME),findsOneWidget);

    await widgetTester.tap(find.text(TEST_DATA_MOVIE_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    expect(find.text(TEST_DATA_MOVIE_NAME),findsOneWidget);
    expect(find.text(TEST_DATA_RELEASED_YEAR),findsOneWidget);
    expect(find.text(TEST_DATA_RATING),findsOneWidget);


  });


}