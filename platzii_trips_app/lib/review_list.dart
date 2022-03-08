import 'package:flutter/material.dart';
import 'package:platzii_trips_app/review.dart';

class ReviewList extends StatelessWidget{

  int reviesNumber = 1;

  ReviewList(this.reviesNumber);

  @override
  Widget build(BuildContext context) {

    var list_review = <Widget>[];

    for (int i =0;i<reviesNumber;i++){
      list_review.add(new Review("assets/img/Viajero.jpg", "Alex", "1 Reivew 5 photos", "Viajando por el mundo"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        list_review.first,
        new Review("assets/img/Viajero.jpg", "Alex", "1 Reivew 5 photos", "Viajando por el mundo"),
        new Review("assets/img/Viajero.jpg", "Alex", "1 Reivew 5 photos", "Viajando por el mundo"),
        new Review("assets/img/Viajero.jpg", "Alex", "1 Reivew 5 photos", "Viajando por el mundo"),
      ],
    );
  }


}