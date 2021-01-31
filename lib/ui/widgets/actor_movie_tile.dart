import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ActorMovieTile extends StatefulWidget {
  final String title;
  final String image;
  final int movieId;

  ActorMovieTile({this.title, this.image, this.movieId});

  @override
  _ActorMovieTileState createState() => _ActorMovieTileState();
}

class _ActorMovieTileState extends State<ActorMovieTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/movieDetails', arguments: <String, int> {
          'movieId': widget.movieId
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/original${widget.image}"),
                        fit: BoxFit.cover)),
              ),
              AutoSizeText(
                widget.title,
                style: TextStyle(fontSize: 14.0),
                maxLines: 2,
              ),
            ],
          )),
    );
  }
}
