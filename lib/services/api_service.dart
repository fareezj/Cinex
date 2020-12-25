import 'package:cinex/services/network_helper.dart';

class ApiService {
  Future<dynamic> fetchPopularData() async {
    String url =
        "https://api.themoviedb.org/3/movie/popular?api_key=a8565c5437741344bd0c9847153c8a07";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> moviesData = await networkHelper.getData();

    return moviesData;
  }

  Future<dynamic> fetchUpcomingData(int page) async {
    String url =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=a8565c5437741344bd0c9847153c8a07&page=$page";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> upcomingMovies = await networkHelper.getData();

    return upcomingMovies;
  }

  Future<dynamic> fetchCategoryData(int category) async {

    String url =
        "https://api.themoviedb.org/3/discover/movie/?api_key=a8565c5437741344bd0c9847153c8a07&with_genres=$category";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> catgoryMovie = await networkHelper.getData();

    return catgoryMovie;
  }
}

// https://api.themoviedb.org/3/movie/upcoming?api_key=a8565c5437741344bd0c9847153c8a07
// ç
