import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app_avanzado/user/ui/screens/profile_trips.dart';
import 'place/ui/screens/home_trips.dart';
import 'place/ui/screens/search_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.indigo),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.indigo),
                  label: ""
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context){
                  return BlocProvider(
                    child: HomeTrips(), 
                    bloc: UserBloc()
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context)  {
                  return BlocProvider(
                    child: ProfileTrips(), 
                    bloc: UserBloc()
                  );
                },
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext context){
                  return BlocProvider(
                    child: HomeTrips(), 
                    bloc: UserBloc()
                  );
                },
              );
          }

        },
      ),
    );
  }

}