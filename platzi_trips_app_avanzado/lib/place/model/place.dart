import 'package:flutter/cupertino.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';

class Place {
  String id;
  String name;
  String descripcion;
  String urlImage;
  int likes;
  bool liked;
  //UserM? userOwner;

  Place({
    Key? key,
    this.id="", 
    required this.name, 
    required this.descripcion, 
    required this.urlImage, 
    this.likes = 0,
    this.liked = false
    //this.userOwner = null
  });
}