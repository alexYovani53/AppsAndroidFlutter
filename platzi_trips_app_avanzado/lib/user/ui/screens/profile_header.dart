import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'package:platzi_trips_app_avanzado/user/ui/widgets/button_bar.dart';
import 'package:platzi_trips_app_avanzado/user/ui/widgets/user_info.dart';
class ProfileHeader extends StatelessWidget {

  final UserM user;

  ProfileHeader({
    Key? key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {

    final title = Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),
        );

      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );

  
  }


  Widget profile(AsyncSnapshot snapshot){

    if(!snapshot.hasData || snapshot.hasError){
      print("no logeado");
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la información. Haz login")
          ],
        ),
      );
    }else{

      final title = Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),
        );

      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
  
    }


 
  }

}