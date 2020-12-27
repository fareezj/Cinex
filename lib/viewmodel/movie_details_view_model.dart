
import 'package:cinex/models/movie_info_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:flutter/material.dart';

class MovieDetailsViewModel extends ChangeNotifier {

  List<MovieInfoModel> movieDetails= List<MovieInfoModel>();
  List<Genres> genreList = List<Genres>();
  List<Cast> movieCastsList = List<Cast>();

  Future<void> getMovieDetailsData(int id) async {

    Map<String, dynamic> movieDetailsData = await ApiService().fetchMovieDetailsData(id);
    movieDetails.clear();
    genreList.clear();

    MovieInfoModel movieInfoModel = new MovieInfoModel();
    movieInfoModel = MovieInfoModel.fromJson(movieDetailsData);
    movieDetails.add(movieInfoModel); // ADD MOVIE DETAILS
    movieDetailsData['genres'].forEach((element) {
      Genres genres = new Genres();
      genres = Genres.fromJson(element);
      genreList.add(genres); // ADD MOVIE GENRE LIST
      notifyListeners();
      print(genres.name);
    });
    // movieDetailsData['credits'].forEach((element) {
    //   Credits credits = new Credits();
    // });
    movieCastsList.clear();
    Credits credits = new Credits();
    credits = Credits.fromJson(movieDetailsData['credits']);
    credits.cast.forEach((element) {
      Cast cast = new Cast();
      cast = Cast.fromJson(element);
      movieCastsList.add(cast);
      notifyListeners();
    });
  }

}