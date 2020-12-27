class MovieCreditModel {
  final int id;
  final List cast;

  MovieCreditModel({this.id, this.cast});

  factory MovieCreditModel.fromJson(Map<String, dynamic> parsedJson) {
    return MovieCreditModel(id: parsedJson['id'], cast: parsedJson['cast']);
  }
}

class Cast {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  factory Cast.fromJson(Map<String, dynamic> parsedJson) {
    return Cast(
      adult: parsedJson['adult'],
      gender: parsedJson['gender'],
      id: parsedJson['id'],
      knownForDepartment: parsedJson['knownForDepartment'],
      name: parsedJson['name'],
      originalName: parsedJson['originalName'],
      popularity: parsedJson['popularity'],
      castId: parsedJson['castId'],
      character: parsedJson['character'],
      creditId: parsedJson['creditId'],
      order: parsedJson['order'],
    );
  }
}
