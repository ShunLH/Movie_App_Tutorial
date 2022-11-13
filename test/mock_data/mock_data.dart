
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

List<MovieVO> getMockMoviesForTest() {
  return [
    MovieVO(
        false,
        "/y5Z0WesTjvn59jP6yo459eUsbli.jpg",
        [878, 28],
        null,
        null,
        null,
        null,
        580489,
        null,
        "en",
        "Terrifier 2",
        "After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.",
        1.677,
        "/b6IRp6Pl2Fsq37r9jFhGoLtaqHm.jpg",
        null,
        null,
        "2022-11-11",
        null,
        null,
        null,
        "Terrifier 2",
        null,
        "Terrifier 2",
        false,
        7.5,
        292,
        true,
        false,
        false),
    MovieVO(
        false,
        "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
        [28, 14, 878],
        null,
        null,
        null,
        null,
        436270,
        null,
        "en",
        "Black Adam",
        "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
        3157.143,
        "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
        null,
        null,
        "2022-10-19",
        null,
        null,
        null,
        "Terrifier 2",
        null,
        "Terrifier 2",
        false,
        6.8,
        280,
        false,
        true,
        false),
    MovieVO(
        false,
        "/mqsPyyeDCBAghXyjbw4TfEYwljw.jpg",
        [10752, 18, 28],
        null,
        null,
        null,
        null,
        49046,
        null,
        "en",
        "Im Westen nichts Neues",
        "Paul Baumer and his friends Albert and Muller, egged on by romantic dreams of heroism, voluntarily enlist in the German army. Full of excitement and patriotic fervour, the boys enthusiastically march into a war they believe in. But once on the Western Front, they discover the soul-destroying horror of World War I.",
        2340.74,
        "/hYqOjJ7Gh1fbqXrxlIao1g8ZehF.jpg",
        null,
        null,
        "2022-10-07",
        null,
        null,
        null,
        "All Quiet on the Western Front",
        null,
        "Im Westen nichts Neues",
        false,
        7.9,
        666,
        false,
        false,
        true),
  ];
}

List<ActorVO> getMockActors() {
  return [
    ActorVO(
        adult: false,
        id: 169337,
        knownFor: [],
        popularity: 488639,
        name: "Patrick Wilson",
        profilePath: "/tc1ezEfIY8BhCy85svOUDtpBFPt.jpg"),
    ActorVO(
        adult: false,
        id: 21657,
        knownFor: [],
        popularity: 488639,
        name: "Vera Farmiga",
        profilePath: "/5Vs7huBmTKftwlsc2BPAntyaQYj.jpg"),
    ActorVO(
        adult: false,
        id: 1731961,
        knownFor: [],
        popularity: 5.167,
        name: "Arne Cheyne Johnson",
        profilePath: "/abf9bZJgMnpeCNsp18Aj2y80WOc.jpg"),
  ];
}

List<GenreVO> getMockGenres() {
  return [
    GenreVO(1, "Action"),
    GenreVO(2, "Adventure"),
    GenreVO(3, "Comedy"),
  ];
}

List<CreditVO> getMockCredits() {
  return [
    CreditVO(
        false,
        2,
        1731961,
        "Acting",
        "Ruairí O'Connor",
        5.167,
        10,
        "Arne Cheyne Johnson",
        "5dfa816b26dac100125940bc",
        2,
        "Ruairí O'Connor",
        "/abf9bZJgMnpeCNsp18Aj2y80WOc.jpg"),
    CreditVO(
        false,
        1,
        2485582,
        "Creating",
        "Sarah Catherine Hook",
        6.016,
        9,
        "Director",
        "5dfa815865686e00188c7924",
        3,
        "Sarah Catherine Hook",
        "/7hYMXYq70cd8DlQjZZCRrbXy9Jy.jpg"),
    CreditVO(
        false,
        1,
        2047847,
        "Acting",
        "Julian Hilliard",
        13.631,
        7,
        "David Glatzel",
        "5dfa812765686e00188c78cb",
        4,
        "Julian Hilliard",
        "/umnRZFm9pQ9xB53PQwUPFOVul4j.jpg")
  ];
}
