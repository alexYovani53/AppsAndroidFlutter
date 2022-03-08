
import 'package:flutter/material.dart';
import 'package:platzii_trips_app/gradient_back.dart';
import 'package:platzii_trips_app/perfil/info_profile.dart';

class HeaderProfile extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    
    return Stack(
      children: [
        new GradientBack("Profile",350.0),
        new InfoProfile()
      ],
    );
  }
  
}