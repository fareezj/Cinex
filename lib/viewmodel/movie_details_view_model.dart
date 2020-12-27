
import 'package:cinex/models/movie_info_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:flutter/material.dart';

class MovieDetailsViewModel extends ChangeNotifier {

  List<MovieInfoModel> movieDetails= List<MovieInfoModel>();
  List<Genres> genreList = List<Genres>();

  Future<void> getMovieDetailsData(int id) async {

    Map<String, dynamic> movieDetailsData = await ApiService().fetchMovieDetailsData(id);
    movieDetails.clear();
    genreList.clear();
    MovieInfoModel movieInfoModel = new MovieInfoModel();
    movieInfoModel = MovieInfoModel.fromJson(movieDetailsData);
    movieDetails.add(movieInfoModel);
    movieDetailsData['genres'].forEach((element) {
      Genres genres = new Genres();
      genres = Genres.fromJson(element);
      genreList.add(genres);
      print(genres.name);
      notifyListeners();
    });

  }
}