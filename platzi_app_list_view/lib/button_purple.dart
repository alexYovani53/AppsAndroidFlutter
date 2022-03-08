import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {


  String textButton = "Navigate";

  ButtonPurple(this.textButton);

  @override
  Widget build(BuildContext context){

    return InkWell(
        onTap: (){
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Vamos!!")));
        },

        child: Container(
          margin: EdgeInsets.only(
            top: 30.0,
            left: 45.0,
            right:50.0
          ),
          height: 30.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [
                Color(0xff00bbf0),
                Color(0xff005792)
              ],
              begin: FractionalOffset(0.2,0.0),
              end: FractionalOffset(1.0,0.7),
              stops: [0.0,0.8],
              tileMode: TileMode.clamp
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xff000000),
                offset: Offset(10.0,5.0),
                blurRadius: 15.0
              )

            ]
          ),
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "LATO",
                fontSize: 18.0
              ),
            ),
          ),
        ),
    );
  }

}