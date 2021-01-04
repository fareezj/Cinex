import 'package:flutter/material.dart';

class ActorMovieTile extends StatefulWidget {

  final String title;
  final String image;

  ActorMovieTile({this.title, this.image});

  @override
  _ActorMovieTileState createState() => _ActorMovieTileState();
}

class _ActorMovieTileState extends State<ActorMovieTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.title),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://image.tmdb.org/t/p/original${widget.image}")
              )
            ),
          )
        ],
      )
    );
  }
}
