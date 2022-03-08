import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_app_list_view/button_purple.dart';

class ReviewItem extends StatelessWidget{

  String image = "assets/rio-dulce.jpg";
  String name = "Rio Dulce";
  ReviewItem(this.image,this.name);

  @override
  Widget build(BuildContext context){

    final star_half = Container(
      margin: EdgeInsets.only(
          left: 3.0
      ),
      child: Icon(
        Icons.star_half,
        size: 20.0,
        color: Color(0xffffffff),
      ),
    );

    final star_border = Container(
      margin: EdgeInsets.only(
          right: 3.0
      ),
      child: Icon(
        Icons.star_border,
        size: 20.0,
        color: Color(0xffffffff),
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(
          right: 3.0
      ),
      child: Icon(
        Icons.star,
        size: 20.0,
        color: Color(0xffffffff),
      ),
    );


    final foto = Container(
      margin: EdgeInsets.only(
        top: 40.0,
        left: 10.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all((Radius.circular(10.0))),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(10.0,5.0),
            blurRadius: 15.0
          )
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image)
        )
      ),
      width: 180.0,
      height: 80.0,
    );

     var datos = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 40.0,
              left: 150.0
            ),
            child: Text(
              name,
              style: TextStyle(
                color: Color(0xff000000),
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(1.0,1.0)
                  ),
                  Shadow(
                      color: Colors.white,
                      offset: Offset(-1.0,-1.0)
                  )
                ],
                fontSize: 20.0,
                fontWeight:  FontWeight.w700
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 100.0
            ),
            child: new ButtonPurple("Go it!"),
          )
        ],
    );



    return Row(

      children: [
          Stack(
            children: [
              foto,
              datos,
              Container(
                margin: EdgeInsets.only(
                  left: 260,
                  top: 95
                ),
                child: Row(

                  children: [
                    star,
                    star_half,
                    star_border,
                  ],
                ),
              )
            ],
          )
      ],
    );
  }

}