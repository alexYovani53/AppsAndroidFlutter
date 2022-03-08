
import 'package:flutter/material.dart';
import 'package:platzii_trips_app/perfil/card_favorite_details.dart';
import 'package:platzii_trips_app/perfil/floating_menu_item.dart';

class CardFavoriteList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(
        top: 315.0
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CardFavoriteDetails(),
          CardFavoriteDetails()
        ],
      )
    );
  }

}