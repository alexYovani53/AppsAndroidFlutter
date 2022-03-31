import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'package:platzi_trips_app_avanzado/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app_avanzado/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app_avanzado/user/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {

  late UserBloc user;

  @override
  Widget build(BuildContext context) {
    
    user = BlocProvider.of(context);

    return StreamBuilder(
      stream: user.authStatus,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        switch( snapshot.connectionState){
          
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot); 

          case ConnectionState.none:
          case ConnectionState.waiting:
          default:
            return const CircularProgressIndicator();
        }
      },
    );


  }

  Widget showProfileData(AsyncSnapshot snapshot){

    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              Text("Usuario no logeado. Haz login")
            ],
          ),
        ],
      );
    }


    var user = UserM(
      uid: snapshot.data.uid,
      name: snapshot.data.displayName,
      email: snapshot.data.email,
      photoURL: snapshot.data.photoURL

    );

    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(user: user),
            ProfilePlacesList(user: user)

          ],
        ),
      ],
    );
  
  }

}