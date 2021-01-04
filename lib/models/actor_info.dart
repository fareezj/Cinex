class ActorInfo {
  String birthday;
  String knownForDepartment;
  String deathday;
  int id;
  String name;
  List<String> alsoKnownAs;
  int gender;
  String biography;
  double popularity;
  String placeOfBirth;
  String profilePath;
  bool adult;
  String imdbId;
  String homepage;
  MovieCredits movieCredits;

  ActorInfo(
      {this.birthday,
        this.knownForDepartment,
        this.deathday,
        this.id,
        this.name,
        this.alsoKnownAs,
        this.gender,
        this.biography,
        this.popularity,
        this.placeOfBirth,
        this.profilePath,
        this.adult,
        this.imdbId,
        this.homepage,
        this.movieCredits});

  factory ActorInfo.fromJson(Map<String, dynamic> json) {
    return ActorInfo(
        birthday: json['birthday'],
        knownForDepartment: json['known_for_department'],
        deathday: json['deathday'] != null ? json['deathday'] : '',
        id: json['id'],
        name: json['name'],
        alsoKnownAs: json['also_known_as'].cast<String>(),
        gender: json['gender'],
        biography: json['biography'],
        popularity: json['popularity'],
        placeOfBirth: json['place_of_birth'],
        profilePath: json['profile_path'],
        adult: json['adult'],
        imdbId: json['imdb_id'],
        homepage: json['homepage'] != null ? json['homepage'] : '',
        movieCredits: MovieCredits.fromJson(json['movie_credits'])
    );
  }
}

class MovieCredits {
  List cast;

  MovieCredits({this.cast});

  factory MovieCredits.fromJson(Map<String, dynamic> json) {
    return MovieCredits(cast: json['cast'] );
  }
}

class MovieCast {
  String character;
  String creditId;
  String releaseDate;
  int voteCount;
  bool video;
  bool adult;
  double voteAverage;
  String title;
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  double popularity;
  int id;
  String backdropPath;
  String overview;
  String posterPath;

  MovieCast({this.character,
    this.creditId,
    this.releaseDate,
    this.voteCount,
    this.video,
    this.adult,
    this.voteAverage,
    this.title,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.id,
    this.backdropPath,
    this.overview,
    this.posterPath});

  factory MovieCast.fromJson(Map<String, dynamic> json) {
    return MovieCast(
        character: json['character'],
        creditId: json['credit_id'],
        releaseDate: json['release_date'],
        voteCount: json['vote_count'],
        video: json['video'],
        adult: json['adult'],
        voteAverage: json['vote_average'],
        title: json['title'],
        genreIds: json['genre_ids'].cast<int>(),
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        popularity: json['popularity'],
        id: json['id'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        posterPath: json['poster_path']
    );
  }
}