import 'package:flutter/material.dart';
import 'package:platzii_trips_app/perfil/cadr_favorite_list.dart';
import 'package:platzii_trips_app/perfil/header_profile.dart';
import 'package:platzii_trips_app/perfil/info_profile.dart';

class ProfileTrips extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        HeaderProfile(),
        CardFavoriteList()
      ],
    );
  }
}