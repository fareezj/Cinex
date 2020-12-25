import 'package:cinex/models/movie_details_model.dart';
import 'package:cinex/ui/widgets/upcoming_movies_tile.dart';
import 'package:cinex/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UpcomingMovies extends StatefulWidget {
  @override
  _UpcomingMoviesState createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  MovieViewModel vm = new MovieViewModel();
  List<MovieDetailsModel> fetchUpcomingData = List<MovieDetailsModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<MovieViewModel>(context, listen: true);
    vm.getUpcomingMoviesData();

    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
              SliverAppBar(
                pinned: false,
                floating: true,
                expandedHeight: 100.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Cinex'),
                ),
                leading: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    vm.getUpcomingMoviesData();
                  },
                ),
              ),
          SliverStaggeredGrid.countBuilder(
              crossAxisCount: 4,
              staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 4 : 2),
              itemBuilder: (BuildContext context , int index) => new Container(
                child: UpcomingMoviesTile(movieImage: vm.upcomingMovies[index].posterPath),
              ),
              itemCount: vm.upcomingMovies.length)

        ],
      ),

      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       pinned: false,
      //       floating: true,
      //       expandedHeight: 100.0,
      //       flexibleSpace: FlexibleSpaceBar(
      //         title: Text('Cinex'),
      //       ),
      //       leading: IconButton(
      //         icon: Icon(Icons.add),
      //         onPressed: () {
      //           vm.getUpcomingMoviesData();
      //         },
      //       ),
      //     ),
      //     // SliverGrid(
      //     //     delegate: SliverChildBuilderDelegate((context, index) {
      //     //       return Padding(
      //     //         padding: const EdgeInsets.all(8.0),
      //     //         child: UpcomingMoviesTile(
      //     //             movieImage: vm.upcomingMovies[index].posterPath),
      //     //       );
      //     //     }, childCount: vm.upcomingMovies.length),
      //     //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     //         crossAxisCount: 2,
      //     //         mainAxisSpacing: 10.0,
      //     //         crossAxisSpacing: 5.0,
      //     //         childAspectRatio: 1)),
      //   ],
      // ),
    );
  }
}
