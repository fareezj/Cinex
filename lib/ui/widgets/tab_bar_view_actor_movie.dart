import 'package:cinex/viewmodel/actor_details_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'actor_movie_tile.dart';

class TabBarViewActorMovie extends StatefulWidget {
  @override
  _TabBarViewActorMovieState createState() => _TabBarViewActorMovieState();
}

class _TabBarViewActorMovieState extends State<TabBarViewActorMovie> {
  var vmActorMovie = ActorDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vmActorMovie = Provider.of<ActorDetailsViewModel>(context, listen: true);

    return Container(
        child: GridView.count(
          childAspectRatio: 0.6,
            crossAxisCount: 2,
            children:
                List.generate(vmActorMovie.actorMovieCredits.length, (index) {
              return ActorMovieTile(
                movieId: vmActorMovie.actorMovieCredits[index].id,
                title: vmActorMovie.actorMovieCredits[index].title,
                image: vmActorMovie.actorMovieCredits[index].posterPath,
              );
            })));
  }
}

// ListView.builder(itemBuilder: (context, index) {
// return ActorMovieTile(
// title: vmActorMovie.actorMovieCredits[index].title,
// image: vmActorMovie.actorMovieCredits[index].posterPath,
// );
// }, itemCount: vmActorMovie.actorMovieCredits.length, scrollDirection: Axis.vertical,),
