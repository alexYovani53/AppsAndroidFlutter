import 'package:flutter/material.dart';
import 'package:platzii_trips_app/card_image.dart';

class CardImageList extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(40.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new CardImage("assets/img/laguna-luchua.jpg"),
          new CardImage("assets/img/playa-blanca.jpg"),
          new CardImage("assets/img/laguna-brava.jpg"),
          new CardImage("assets/img/rio-dulce.jpg"),
          new CardImage("assets/img/Semuc-Champey.jpg")
        ],
      ),
    );
  }
  
  
}