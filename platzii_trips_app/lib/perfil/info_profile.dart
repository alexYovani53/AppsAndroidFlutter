
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzii_trips_app/perfil/floating_menu_item.dart';

class InfoProfile extends StatelessWidget{

  /*
  void limpiar(int index){
    items[0].pressed
  }
  */

  List<FloatingMenuItem> items = [
    FloatingMenuItem(Icons.bookmark),
    FloatingMenuItem(Icons.card_giftcard),
    FloatingMenuItem(Icons.add),
    FloatingMenuItem(Icons.mail_outline),
    FloatingMenuItem(Icons.person)
  ];

  @override
  Widget build(BuildContext context) {



    final fotografia = Container(
      height: 110.0,
      width: 110.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/img/perfil.jpg"),
          fit: BoxFit.cover
        )
      ),
    );

    final datos = Container(
      margin: EdgeInsets.only(
        top: 15.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Alex Jerónimo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20.0
            ),
          ),
          Text(
            "ajeronimo@universales.com",
            style: TextStyle(
                color: Color(0xaea89e9e),
                fontWeight: FontWeight.w700,
                fontSize: 14.0
            ),
          ),
        ],
      ),
    );


    return Container(
      margin: EdgeInsets.only(
        top: 100.0
      ),
      height: 300.0,
      child: Column(
        children: [
          Row(
            children: [
              fotografia,
              datos
            ],
          ),
           Container(
            margin: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: items,
              ),

            ),



        ],
      )
    );
  }
}