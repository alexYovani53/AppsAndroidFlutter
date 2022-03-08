import 'package:flutter/material.dart';
import 'package:platzii_trips_app/floating_action_button_green.dart';


class CardImage extends StatelessWidget{

  
  String pathImage = "assets/img/Viajero.jpg";


  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(
        left: 5.0,
        top:80.0
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
      alignment: Alignment(0.9,1.1),
      children: [
        card,
        FloatingActionButtonGreen()
      ],
    );
  }



}