
import 'package:cinex/models/movie_details_model.dart';
import 'package:cinex/models/movie_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class MovieViewModel extends ChangeNotifier {

  List<MovieDetailsModel> movies = List<MovieDetailsModel>();

  Future<void> getMoviesData() async {

    Map<String, dynamic> moviesData = await ApiService().fetchData();
    print(moviesData);
    moviesData['results'].forEach((element) {
      MovieDetailsModel movieDetailsModel = new MovieDetailsModel();
      movieDetailsModel = MovieDetailsModel.fromJson(element);
      movies.add(movieDetailsModel);
      notifyListeners();
    });
  }
}