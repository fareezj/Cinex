
class MovieModel {

  final int page;
  final List results;

  MovieModel({this.page, this.results});

  factory MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    return MovieModel(
      page: parsedJson['page'],
      results: parsedJson['results'],
    );
  }

}

