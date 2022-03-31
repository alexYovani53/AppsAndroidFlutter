import 'package:flutter/material.dart';


class TitleHeader extends StatelessWidget {

  final String title;

  const TitleHeader({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    double screenWidht = MediaQuery.of(context).size.width - 200.0;

    // return Flexible(
    //   child: Container(
    //     width: screenWidht,
    //     child: Text(
    //       title,
    //       style: const TextStyle(
    //         color: Colors.white,
    //         fontFamily: "Lato",
    //         fontSize: 30.0,
    //         fontWeight: FontWeight.bold
    //       ),
    //     ),
    //   ),
    // );

    
    return Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          );
    }
}