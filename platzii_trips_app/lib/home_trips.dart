import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzii_trips_app/description_place.dart';
import 'package:platzii_trips_app/header_appbar.dart';
import 'package:platzii_trips_app/review_list.dart';


class HomeTrips extends StatelessWidget{


  final descriptionDummy =  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales enim quis lectus bibendum pellentesque. Fusce malesuada aliquet elit id viverra. Aliquam euismod orci libero. Fusce vitae viverra massa, ut tincidunt ex. Maecenas mattis lacus eget massa bibendum commodo. Sed tincidunt leo massa, vitae vehicula erat convallis a. Nulla id justo lacus. Nulla dolor turpis, imperdiet vitae volutpat quis, consequat id risus.';

  @override
  Widget build(BuildContext context){


    return Stack(
      children: [
        ListView(
          children: <Widget>[
            new DescriptionPlace("Bahamas",4,descriptionDummy),
            new ReviewList(2)
          ],
        ),
        HeaderAppBar()
      ],
    );
  }
}