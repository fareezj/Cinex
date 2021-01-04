import 'package:cinex/models/actor_info.dart';
import 'package:cinex/models/movie_info_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:flutter/material.dart';

class ActorDetailsViewModel extends ChangeNotifier {

  ActorInfo actorDetailsData = new ActorInfo();
  List<MovieCredits> actorMovieCredits = List<MovieCredits>();

  Future<void> getActorDetailsData(int id) async {

    Map<String, dynamic> actorDetails = await ApiService().fetchActorDetails(id);


    actorMovieCredits.clear();
    ActorInfo actorInfo = new ActorInfo();
    actorInfo = null;
    actorInfo = ActorInfo.fromJson(actorDetails);
    actorDetailsData = actorInfo;
    notifyListeners();
    actorDetails['movie_credits'].forEach((element) {
      MovieCredits movieCredits = new MovieCredits();
      movieCredits = MovieCredits.fromJson(element);
      actorMovieCredits.add(movieCredits);
      notifyListeners();
    });
  }
}