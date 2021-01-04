import 'package:cinex/models/actor_info.dart';
import 'package:cinex/models/movie_info_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:cinex/viewmodel/actor_details_view_model.dart';
import 'package:flutter/material.dart';

class ActorDetailsViewModel extends ChangeNotifier {

  ActorInfo actorDetailsData = new ActorInfo();
  List<MovieCast> actorMovieCredits = List<MovieCast>();

  Future<void> getActorDetailsData(int id) async {

    Map<String, dynamic> actorDetails = await ApiService().fetchActorDetails(id);

    ActorInfo actorInfo = new ActorInfo();
    actorInfo = null;
    actorInfo = ActorInfo.fromJson(actorDetails);
    actorDetailsData = actorInfo;
    notifyListeners();
       MovieCredits movieCredits = new MovieCredits();
       movieCredits = MovieCredits.fromJson(actorDetails['movie_credits']);
       actorMovieCredits.clear();
       movieCredits.cast.forEach((element) {
         MovieCast movieCast = new MovieCast();
         movieCast = MovieCast.fromJson(element);
         actorMovieCredits.add(movieCast);
         notifyListeners();
       });
    // actorDetails['movie_credits'].forEach((element) {
    //   MovieCredits movieCredits = new MovieCredits();
    //   movieCredits = MovieCredits.fromJson(element);
    //   actorMovieCredits.clear();
    //   movieCredits.cast.forEach((element) {
    //     MovieCast movieCast = new MovieCast();
    //     movieCast = MovieCast.fromJson(element);
    //     actorMovieCredits.add(movieCast);
    //     print(actorMovieCredits.toString());
    //     notifyListeners();
    //   });
    // });
  }
}