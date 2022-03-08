import 'package:flutter/material.dart';
import 'package:platzii_trips_app/button_purple.dart';


class DescriptionPlace extends StatelessWidget{

  String namePlace;
  int stars;
  String descripcion;


  DescriptionPlace(this.namePlace, this.stars, this.descripcion);

  @override
  Widget build(BuildContext context){

    final star_half = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFF2C611),
      ),
    );

    final star_border = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFF2C611),
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFF2C611),
      ),
    );

    final title_starts = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left:20.0,
            top: 320.0,
            right: 20.0
          ),
          child: Text(
            this.namePlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            star_border,
            star_half
          ],
        )
      ],
    );

    final description = Container (
      margin: new EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0
      ),
      child: new Text(
        this.descripcion,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xff5657fa)
        )
      ),
    );


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_starts,
        description,
        new ButtonPurple("Navegar")
      ],
    );
  }
}