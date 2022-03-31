import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {


  String title = "Popular";
  double? height;

  GradientBack({Key? key,this.title="",this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    
    if(height == null ){
      height = screenHeight;
    }

    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient:  LinearGradient(
            stops: [
                    0.10, 
                    0.46, 
                    0.62, 
                    0.84, 
                    0.90, 
                    ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
                  Color(0xFFFC77FB), 
                  Color(0xFF000000), 
                  Color(0xFF000000), 
                  Color(0xFF000000), 
                  Color(0xFFEE9944), 
                  ],
          )
      
      ),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5,-0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius:  BorderRadius.circular(screenHeight/2)
          ),
        ),
      ),

      // child: Text(
      //   title,
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontSize: 30.0,
      //     fontFamily: "Lato",
      //     fontWeight: FontWeight.bold
      //   ),
      // ),

      alignment: Alignment(-0.9, -0.6),

    );
  }

}