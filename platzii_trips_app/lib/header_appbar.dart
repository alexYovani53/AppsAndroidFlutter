import 'package:flutter/material.dart';
import 'package:platzii_trips_app/card_image_list.dart';
import 'package:platzii_trips_app/gradient_back.dart';

class HeaderAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){


    return Stack(
      children: <Widget>[
        new GradientBack("Universales",250.0),
        new CardImageList()
      ],
    );
  }
}