
import 'package:flutter/material.dart';
import 'package:platzii_trips_app/perfil/card_favorite_details.dart';
import 'package:platzii_trips_app/perfil/floating_menu_item.dart';

class CardFavoriteList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(
        top: 0
      ),
      child: Column(
        children: [
          CardFavoriteDetails("assets/img/Semuc-Champey.jpg","Semuc-Champey","Un enclave natural localizado en el municipio guatemalteco de Lanquín, en el departamento de Alta Verapaz, Guatemala"),
          CardFavoriteDetails("assets/img/rio-dulce.jpg","Rio Dulce","El río Dulce se encuentra en el departamento de Izabal, Guatemala, entre el lago de Izabal y la bahía de Amatique"),
          CardFavoriteDetails("assets/img/laguna-luchua.jpg","Laguna Luchua","Es un cenote en Guatemala. Está ubicada en la selva tropical en el municipio de Cobán, Alta Verapaz"),
          CardFavoriteDetails("assets/img/laguna-brava.jpg","Laguna Brava","La Laguna Brava ​ es un manto lacustre que se encuentra en Guatemala, a 1142 metros de altura sobre el nivel del mar."),
          CardFavoriteDetails("assets/img/Semuc-Champey.jpg","Semuc-Champey","Un enclave natural localizado en el municipio guatemalteco de Lanquín, en el departamento de Alta Verapaz, Guatemala"),
          CardFavoriteDetails("assets/img/rio-dulce.jpg","Rio Dulce","El río Dulce se encuentra en el departamento de Izabal, Guatemala, entre el lago de Izabal y la bahía de Amatique"),
          CardFavoriteDetails("assets/img/laguna-luchua.jpg","Laguna Luchua","Es un cenote en Guatemala. Está ubicada en la selva tropical en el municipio de Cobán, Alta Verapaz"),
          CardFavoriteDetails("assets/img/laguna-brava.jpg","Laguna Brava","La Laguna Brava ​ es un manto lacustre que se encuentra en Guatemala, a 1142 metros de altura sobre el nivel del mar."),
          CardFavoriteDetails("assets/img/playa-blanca.jpg","Playa Blanca","")
        ],
      )
    );
  }

}