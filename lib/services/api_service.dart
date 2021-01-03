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
    Map<String, dynamic> categoryMovie = await networkHelper.getData();

    return categoryMovie;
  }

  Future<dynamic> fetchMovieDetailsData(int id) async {

    String url =
        "https://api.themoviedb.org/3/movie/$id?api_key=a8565c5437741344bd0c9847153c8a07&append_to_response=movies,credits";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> movieDetails = await networkHelper.getData();

    return movieDetails;
  }

  Future<dynamic> fetchActorDetails(int actorId) async {

    String url =
        "https://api.themoviedb.org/3/person/$actorId?api_key=a8565c5437741344bd0c9847153c8a07&append_to_response=movie_credits,tv_credits";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> actorDetails = await networkHelper.getData();

    return actorDetails;
  }

}

// https://api.themoviedb.org/3/movie/upcoming?api_key=a8565c5437741344bd0c9847153c8a07
// https://api.themoviedb.org/3/movie/157336?api_key={api_key}&append_to_response=videos,images
