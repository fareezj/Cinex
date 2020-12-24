
import 'package:cinex/models/movie_details_model.dart';
import 'package:cinex/models/movie_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class MovieViewModel extends ChangeNotifier {

  List<MovieDetailsModel> movies = List<MovieDetailsModel>();
  List<MovieDetailsModel> upcomingMovies = List<MovieDetailsModel>();
  List<MovieDetailsModel> categoryMovies = List<MovieDetailsModel>();

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

  Future<void> getUpcomingMoviesData() async {

    Map<String, dynamic> upcomingMoviesData = await ApiService().fetchUpcomingData();
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

  void clearCategoryList() {
    categoryMovies.clear();
    notifyListeners();
  }
}