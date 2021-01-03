import 'package:flutter/material.dart';
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
      print('actorID: $actorId');
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
                        Text(vm.actorDetailsData.name),
                        Text(vm.actorDetailsData.popularity.toString()),
                      ],
                    ),
                    Text(vm.actorDetailsData.biography),
                    Text(vm.actorDetailsData.birthday),
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
