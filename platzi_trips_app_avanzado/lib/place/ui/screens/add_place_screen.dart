
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/place/model/place.dart';
import 'package:platzi_trips_app_avanzado/place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app_avanzado/place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app_avanzado/widgets/button_purple.dart';
import 'package:platzi_trips_app_avanzado/widgets/gradient_back.dart';
import 'package:platzi_trips_app_avanzado/widgets/text_input.dart';
import 'package:platzi_trips_app_avanzado/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {

  File? image;
  
  AddPlaceScreen({ Key? key, required this.image }) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {




  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of(context);
    final controllerTituloPlace = TextEditingController();
    final controllerDescripcionPlace = TextEditingController();
    final controllerLocacionPlace = TextEditingController();

    String ruta= "assets/img/beach_palm.jpeg";
    
    if (widget.image != null){
      ruta = widget.image!.path;
    }

    print("Esta es la ruta ----> "+ruta);


    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300.0,title: ""),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 25.0,
                  left: 5.0
                ),
                child:  SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left,color:Colors.white,size:45),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(top: 45.0  , left: 20.0 , right: 10.0),
                  child: const TitleHeader(title: "Agrega un nuevo lugar"),
                )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top:120.0,bottom: 20.0),
            child: ListView(
              children:[
                Container(
                  alignment: Alignment.center,
                  height: 270.0,
                  child: CardImage(
                    //pathImage:"assets/img/beach_palm.jpeg",
                    //pathImage: widget.image!=null? widget.image!.path: "assets/img/beach_palm.jpeg" ,
                    pathImage: ruta,
                    iconData: Icons.camera,
                    width: 350.0,
                    internet: false,
                    height: 250.0,
                    onPressedFabIcon: (){
                      
                    },
                    left: 0.0,

                  ),
                ),//Foto
                Container(
                  margin: EdgeInsets.only(bottom:20.0),
                  child: TextInput(
                    hintText: "Titulo",
                    inputType: TextInputType.text,
                    maxLines: 1,
                    controller:controllerTituloPlace ,
                  ),
                ),
                TextInput(
                  hintText: "Descripcion", 
                  inputType: TextInputType.multiline, 
                  controller: controllerDescripcionPlace,
                  maxLines: 4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Ubicación",
                    iconData: Icons.location_on,
                    controller: controllerLocacionPlace,
                  ),
                ),
                Container(
                  height: 70.0,
                  child: ButtonPurple(
                    buttonText: "Cargar",
                    onPressed: () async{
                     
                      // ID del usuario logeado actualmente.                       
                      String uid = "N/A"; 
                      String URLfinal_ = "";
                      uid = (await userBloc.usuarioActual())!.uid;
                      
                      if( uid  != "N/A"){
                        String path = "${uid}/${DateTime.now().toString()}.jpg";
                        File nuevo = widget.image ?? File("") ;
                        
                        final uploadTask = await userBloc.uploadFile(path, nuevo); 
                        if (UploadTask == null){
                          print("Null upload task");
                          return;
                        }

                        final urlFinal = await uploadTask.then((p0) => p0.ref.getDownloadURL());
                        URLfinal_ =  urlFinal;


                      }



                      //2. CLUD FIRESTORE
                      userBloc.updatePlaceData(Place(
                        name: controllerTituloPlace.text,
                        descripcion: controllerDescripcionPlace.text,
                        likes: 0,
                        urlImage: URLfinal_
                      )).whenComplete(() =>  {
                        print("TERMINO"),
                        Navigator.pop(context)
                      });
                    },
                  ),
                )
              ]
            ),
          )
        ],
      ),
      
    );
  }
}