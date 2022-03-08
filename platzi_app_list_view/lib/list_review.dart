
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_app_list_view/review_item.dart';

class ListReview extends StatelessWidget{


  @override
  Widget build(BuildContext context){


    return Container(
      constraints: BoxConstraints.expand(),
      child: ListView(
        padding: EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        children: [
          new ReviewItem("cascada-amantes.jpg","Cascada los Amantes"),
          new ReviewItem("laguna-brava.jpg", "Laguna Brava"),
          new ReviewItem("laguna-luchua.jpg","Laguna Luchua"),
          new ReviewItem("playa-blanca.jpg","Playa Blanca"),
          new ReviewItem("rio-dulce.jpg","Rio Dulce"),
          new ReviewItem("Semuc-Champey.jpg","Semuc Champey"),
          new ReviewItem("volcan-pacaya.jpg","Volcan Pacaya"),
        ],
      )
    );

  }

}