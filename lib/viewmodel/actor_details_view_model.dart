import 'package:cinex/models/actor_info.dart';
import 'package:cinex/models/movie_info_model.dart';
import 'package:cinex/services/api_service.dart';
import 'package:flutter/material.dart';

class ActorDetailsViewModel extends ChangeNotifier {

  ActorInfo actorDetailsData = ActorInfo();

  Future<void> getActorDetailsData(int id) async {

    Map<String, dynamic> actorDetails = await ApiService().fetchActorDetails(id);

    ActorInfo actorInfo = new ActorInfo();
    actorInfo = ActorInfo.fromJson(actorDetails);
    actorDetailsData = actorInfo;
    print('AD: $actorDetailsData');
    notifyListeners();
  }
}