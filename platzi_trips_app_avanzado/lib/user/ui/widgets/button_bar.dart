import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app_avanzado/place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'circle_button.dart';


class ButtonsBar extends StatelessWidget {

  late UserBloc userBloc;
 
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //CircleButton(true, Icons.turned_in_not, 20.0, Color.fromRGBO(255, 255, 255, 1)),
            //cambiar contraseña
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6),()=>{

            }),
            //Agregar lugar
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
            ()async {
              
              File? image=null;

              final picker = ImagePicker();
              picker.pickImage(source: ImageSource.camera)
              .then((value) => {
                image = File(value!.path),
                Navigator.push(context,MaterialPageRoute(
                    builder: (BuildContext context)=> AddPlaceScreen(image: image)
                  )
                )
              })              
              .catchError((onError)=>print(onError));
              

            }),
            //Cerrar sesión
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),()=>{
              userBloc.signOut()
            }),
            
            //CircleButton(true, Icons.person, 20.0, Color.fromRGBO(255, 255, 255, 0.6))
          ],
        )
    );
  }

}