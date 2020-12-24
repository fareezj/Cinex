import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_movies_tile.dart';
import 'package:cinex/viewmodel/movie_view_model.dart';

class TabBarViewItem extends StatefulWidget {
  @override
  _TabBarViewItemState createState() => _TabBarViewItemState();
}

class _TabBarViewItemState extends State<TabBarViewItem> {
  var vmCategory = MovieViewModel();

  @override
  Widget build(BuildContext context) {
    vmCategory = Provider.of<MovieViewModel>(context, listen: true);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryMoviesTile(
              movieImage: vmCategory.movies[index].posterPath,
              movieTitle: vmCategory.movies[index].title,
            );
          },
          itemCount: vmCategory.movies.length,
        ),
      ),
    );
  }
}
