import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  
  double ancho = 0.0;
  double alto = 0.0;
  final String text;
  final VoidCallback onPressed;

  ButtonGreen( {Key? key, required this.text,required this.alto, required this.ancho,required this.onPressed}) : super(key: key) ;


  @override
  State<ButtonGreen> createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed ,
      child: Container(
        margin: const EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        height: widget.alto,
        width: widget.ancho,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 66, 211, 122),
                Color.fromARGB(255, 14, 192, 29)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp

            )

        ),

        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: "Lato",
              color: Colors.white
            ),

          ),
        ),
      ),
    );
  }
}