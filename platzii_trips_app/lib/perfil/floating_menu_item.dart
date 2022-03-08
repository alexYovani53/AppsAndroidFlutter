
import 'package:flutter/material.dart';

class FloatingMenuItem extends StatefulWidget{

  IconData icono = Icons.add;
  bool pressed = false;

  FloatingMenuItem(this.icono);

  @override
  State<StatefulWidget> createState() {
    return _FloatingMenuItem(icono,pressed);
  }

}

class _FloatingMenuItem extends State<FloatingMenuItem>{

  IconData icono = Icons.add;
  bool pressed = false;
  _FloatingMenuItem(this.icono,this.pressed);

  void onPressedFav(){
    setState(() {
      pressed = !this.pressed;
    });

  }

  @override
  Widget build (BuildContext context){
    return FloatingActionButton(
      backgroundColor: this.pressed? Color(0xffffffff):Color(0xffbcd728),
      mini: this.pressed?false:true,
      tooltip:"Fav",
      onPressed: onPressedFav,
      child: Icon(
          icono,
        color: pressed? Colors.green:Colors.white,
      ),

    );
  }
}