


import 'package:flutter/cupertino.dart';
import 'package:platzi_trips_app_avanzado/place/model/place.dart';

class UserM{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  List<Place> myPlaces;
  List<Place> myFavoritePlaces;

  UserM({
    Key? key,
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.myPlaces=const [],
    this.myFavoritePlaces=const[]
  });

  
}