
import 'package:cinex/models/movie_details_model.dart';
import 'package:cinex/models/movie_info_model.dart';
import 'package:cinex/models/movie_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class MovieViewModel extends ChangeNotifier {

  List<MovieDetailsModel> movies = List<MovieDetailsModel>();
  List<MovieDetailsModel> categoryMovies = List<MovieDetailsModel>();
  List<MovieDetailsModel> upcomingMovies = List<MovieDetailsModel>();
  List<MovieInfoModel> movieDetails= List<MovieInfoModel>();
  List<Genres> genreList = List<Genres>();

  Future<void> getPopularMoviesData() async {

    Map<String, dynamic> moviesData = await ApiService().fetchPopularData();
    print(moviesData);
    moviesData['results'].forEach((element) {
      MovieDetailsModel movieDetailsModel = new MovieDetailsModel();
      movieDetailsModel = MovieDetailsModel.fromJson(element);
      movies.add(movieDetailsModel);
      notifyListeners();
    });
  }

  Future<void> getUpcomingMoviesData(int page) async {

    Map<String, dynamic> upcomingMoviesData = await ApiService().fetchUpcomingData(page);
    upcomingMoviesData['results'].forEach((element) {
      MovieDetailsModel movieDetailsModel = new MovieDetailsModel();
      movieDetailsModel = MovieDetailsModel.fromJson(element);
      upcomingMovies.add(movieDetailsModel);
      notifyListeners();
    });
  }

  Future<void> getCategoryMoviesData(int category) async {

    Map<String, dynamic> categoryMoviesData = await ApiService().fetchCategoryData(category);
    clearCategoryList();
    categoryMoviesData['results'].forEach((element) {
      MovieDetailsModel movieDetailsModel = new MovieDetailsModel();
      movieDetailsModel = MovieDetailsModel.fromJson(element);
      categoryMovies.add(movieDetailsModel);
      notifyListeners();
    });
  }

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

  void clearCategoryList() {
    categoryMovies.clear();
    notifyListeners();
  }
}