import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app_avanzado/place/model/place.dart';
import 'package:platzi_trips_app_avanzado/place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'package:platzi_trips_app_avanzado/user/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;



  void updateUserDAta(UserM user) async{
    DocumentReference ref = db.collection(USERS).doc(user.uid);


    bool yaExiste = await (validacion(user.uid).then((value) => value));

    print("Usuario existente o no >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ");
    print(yaExiste);

    if (yaExiste) {
      return await ref.set({
        "uid":user.uid,
        "name":user.name,
        "email":user.email,
        "photoURL":user.photoURL,
        "lastSingIn":DateTime.now()
      },SetOptions(merge: true));
      
    }else{
      return await ref.set({
        "uid":user.uid,
        "name":user.name,
        "email":user.email,
        "photoURL":user.photoURL,
        "myPlaces":user.myPlaces,
        "myFavoritePlaces":user.myFavoritePlaces,
        "lastSingIn":DateTime.now()
      },SetOptions(merge: true));
    }

  }

  Future<void> updatePlaceData(Place place) async{
    CollectionReference refPlaces = db.collection(PLACES);

    String identificador = "null";
    identificador =  (auth.currentUser)!.uid; 

    
    DocumentReference refUsers;



    await refPlaces.add({      
      'name':place.name,
      'descripcion':place.descripcion,
      'likes':place.likes,
      'userOwner':db.doc("${USERS}/${identificador}"),
      'urlImage':place.urlImage,
      'userLiked': FieldValue.arrayUnion([])
    }).then((dr) => {
      dr.get().then((snapshot) => {
        
        refUsers = db.collection(USERS).doc(identificador),
        refUsers.update({
          'myPlaces': FieldValue.arrayUnion([db.doc("$PLACES/${snapshot.id}")])
        })

      })
    });

  }

    Future<bool> validacion(String uid) async {

      bool retorno = false;
      var data = FirebaseFirestore.instance.collection(CloudFirestoreAPI().USERS)
      .where("uid",isEqualTo: uid).get();

      await data.then((value) => {
        print("***************sfdasdfasdfas*>>>>>>>>>>>>>>>>>>>>>>>>>>>SFdfs>>>>>>>>>>>"),
        retorno = value.docs.isNotEmpty
      });

      return retorno;
    }




  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot){

    List<ProfilePlace> profilePlaces = [];
    
    for (var p in placesListSnapshot) {
      profilePlaces.add(ProfilePlace('assets/img/river.jpeg',Place(
          name: p['name'],
          descripcion: p['descripcion'],
          urlImage: p['urlImage'],
          likes: p['likes'])));
    }

    return profilePlaces;
  }

  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, UserM user){
  
    List<Place> places = [];
    
    placesListSnapshot.forEach((DocumentSnapshot p) {

      Place place = Place(
          id: p.id,
          name: p["name"],
          descripcion: p["descripcion"],
          urlImage: p["urlImage"],
          likes: p["likes"]
      );

      List<dynamic>? usersLikedRefs = p["userLiked"];
      place.liked = false;

      usersLikedRefs?.forEach((drUl) {
        if (user.uid == drUl.id) {
          place.liked = true;
        }
      });

      places.add(place);
    });


    /*CardImage(
        pathImage:p["urlImage"],
        iconData: Icons.favorite_border,
        width: 350.0 , 
        height: 250.0,
        onPressedFabIcon: (){
          //Like
          likePlace(p.id);
        },
        left: 20.0,
      ));*/

    return  places;
  }


  Future likePlace(Place place, String uid) async{
    int likes = 0;
    await db.collection(PLACES).doc(place.id).get()
    .then((DocumentSnapshot ds) => {


        likes = ds["likes"],
        db.collection(PLACES).doc(place.id).update({
        'likes': place.liked ? likes + 1 : likes - 1,
        'userLiked': place.liked
            ? FieldValue.arrayUnion([db.doc("${USERS}/${uid}")])
            : FieldValue.arrayRemove([db.doc("${USERS}/${uid}")])
        })
    });
  }

}