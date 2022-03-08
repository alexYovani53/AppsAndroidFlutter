import 'package:flutter/material.dart';

class Review extends StatelessWidget{

  String path_image = "assets/img/Viajero.jpg";
  String userName = "Alex Yovai";
  String details = "1 review 5 photos";
  String comment = "Este es un lugar maravillozo de Guatemala";

  Review(this.path_image,this.userName,this.details,this.comment);

  @override
  Widget build(BuildContext context) {

    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/img/perfil.jpg'),
          fit: BoxFit.cover
        )
      ),
    );


    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
        this.userName,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 17.0
        ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        this.details,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
          color: Color(0xffa3a5a7)
        ),
      ),
    );

    final userComent = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        this.comment,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            color: Color(0xff1616dc)
        ),
      ),
    );



    final userDatails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComent
      ],
    );

    return Row(
      children: <Widget>[
        photo,
        userDatails
      ],
    );
  }
  
}