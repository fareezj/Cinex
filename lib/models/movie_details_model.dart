class MovieDetailsModel{

  final String posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final List genreId;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final num voteAverage;

  MovieDetailsModel({
      this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreId,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> parsedJson) {
    return MovieDetailsModel(
        posterPath: parsedJson['poster_path'],
        adult: parsedJson['adult'],
        overview: parsedJson['overview'],
        releaseDate: parsedJson['release_date'],
        genreId: parsedJson['genre_ids'],
        id: parsedJson['id'],
        originalTitle: parsedJson['original_title'],
        originalLanguage: parsedJson['original_language'],
        title: parsedJson['title'],
        backdropPath: parsedJson['backdrop_path'],
        popularity: parsedJson['popularity'],
        voteCount: parsedJson['vote_count'],
        video: parsedJson['video'],
        voteAverage: parsedJson['vote_average']
    );
  }
}

// {
// "page": 1,
// "results": [
// {
// "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
// "adult": false,
// "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
// "release_date": "2016-08-03",
// "genre_ids": [
// 14,
// 28,
// 80
// ],
// "id": 297761,
// "original_title": "Suicide Squad",
// "original_language": "en",
// "title": "Suicide Squad",
// "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
// "popularity": 48.261451,
// "vote_count": 1466,
// "video": false,
// "vote_average": 5.91
// },
