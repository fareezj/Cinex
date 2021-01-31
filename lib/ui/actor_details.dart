import 'package:cinex/ui/widgets/tab_bar_view_actor_movie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cinex/viewmodel/actor_details_view_model.dart';

class ActorDetails extends StatefulWidget {
  @override
  _ActorDetailsState createState() => _ActorDetailsState();
}

class _ActorDetailsState extends State<ActorDetails> {
  var actorId;
  var vm = ActorDetailsViewModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Map<String, dynamic> arguments =
          ModalRoute.of(context).settings.arguments as Map;
      arguments.forEach((key, value) {
        if (key == 'actorId') {
          actorId = value;
        }
      });
      vm.getActorDetailsData(actorId);
      //vm.actorMovieCredits
    });
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<ActorDetailsViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Actor Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  margin: EdgeInsets.all(50.0),
                  height: MediaQuery.of(context).size.height / 2.7,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/original${vm.actorDetailsData.profilePath}"),
                          fit: BoxFit.fill)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(vm.actorDetailsData.name, style:
                          GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('Popularity Rating:', style: GoogleFonts.poppins()),
                            Row(
                              children: [
                                Text(vm.actorDetailsData.popularity.toString()),
                                Icon(
                                  Icons.star_sharp,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0)
                          ],
                        )
                      ],
                    ),
                    Text(vm.actorDetailsData.biography, style:
                      GoogleFonts.poppins(fontSize: 15.0, color: Colors.lightBlue[900]),
                    ),
                    Text(vm.actorDetailsData.birthday),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Expanded(
                        child: DefaultTabController(
                            length: 2,
                            child: Builder(
                              builder: (BuildContext context) {
                                final TabController tabController =
                                    DefaultTabController.of(context);
                                tabController.addListener(() {
                                  if (!tabController.indexIsChanging) {
                                    switch (tabController.index) {
                                      case 0:
                                        {}
                                        break;
                                      case 1:
                                        {}
                                        break;
                                    }
                                  }
                                });
                                return Scaffold(
                                  appBar: AppBar(
                                    bottom: TabBar(
                                      tabs: [
                                        Text('Movie'),
                                        Text('TV Dramas'),
                                      ],
                                    ),
                                  ),
                                  body: TabBarView(
                                    children: [
                                      Container(
                                        child: TabBarViewActorMovie(),
                                      ),
                                      Container(
                                        child: Text('tv'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
