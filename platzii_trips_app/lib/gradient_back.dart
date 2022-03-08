import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{

  String title = "Popular";
  double altura = 250.0;


  GradientBack(this.title,this.altura);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: altura,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff00BBF0),
            Color(0xff29DE92)
          ],
          begin: FractionalOffset(0.2,0.0),
          end: FractionalOffset(1.0,0.6),
          stops: [0.0,0.6],
          tileMode: TileMode.clamp
        )
      ),
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),

      ),
      alignment: Alignment(-0.9,-0.6),
    );

  }


}