import 'package:flutter/material.dart';
import 'package:platzii_trips_app/floating_action_button_green.dart';


class CardFavoriteDetails extends StatelessWidget{

  String pathImage = "assets/img/Viajero.jpg";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final datos = Container(
      width: 250,
      margin: EdgeInsets.only(
        top: 245.0
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: EdgeInsets.all(15.0),
      child: Stack(
        alignment: Alignment(-0.9,0.1),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre1",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),
              ),
              Text(
                "Descripcion 1 ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0
                ),
              ),
              Text(
                "Steps 123,123,123",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.orange
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: 170,
              bottom: 0
            ),
            child:
            FloatingActionButtonGreen(),
          )
        ],
      )
    );

    final card = Container(
      height: 250.0,
      width: 350.0,
      margin: EdgeInsets.only(
          left: 5.0,
          top:0
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pathImage)
          ),
          borderRadius: BorderRadius.all(Radius.circular((10.0))),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black,
                blurRadius: 15.0,
                offset: Offset(10.0,5.0)
            )
          ]
      ),
    );

    return Stack(
      alignment: Alignment(0.0,-0.5),
      children: [
        card,
        datos
      ],
    );

  }

}