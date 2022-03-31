import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/place/model/place.dart';
import 'package:platzi_trips_app_avanzado/place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app_avanzado/place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'package:platzi_trips_app_avanzado/user/repository/auth_repository.dart';
import 'package:platzi_trips_app_avanzado/user/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app_avanzado/user/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app_avanzado/user/ui/widgets/profile_place.dart';

class UserBloc implements Bloc{
  
  final auth_repository = AuthRepository();
  final cloudfirestoreRepository = CloudfirestoreRepository();
  final firebaseStorageRepositoryPlace = FirebaseStorageRepository();

  

  //Flujo de datos - Streams
  // Stream - Firebase
  // StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  Future<User?> usuarioActual() async{
    User? us =   FirebaseAuth.instance.currentUser;
    return us;
  }
  //Casos uso
  //1. Sign In a la aplicación Google

  Future<UserCredential> signIns(){
    
    return auth_repository.signInFirebase();
  }

  
  Future<UserCredential> signIn(){
    Map<String, dynamic> lugares;

    Future<UserCredential> data = auth_repository.signInFirebase();
    data.then((value) => {
      asyncvalid(value.user!.uid)
    });

    return  auth_repository.signInFirebase();
  }



  //2. Registrar usuario en base de datos
  void updateUserData(UserM user) => cloudfirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place)=> cloudfirestoreRepository.updatePlaceData(place);
 
 
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;

  List<ProfilePlace> buildMyPlaces(placesListSnapshot) => cloudfirestoreRepository.buildMyPlaces(placesListSnapshot);
  List<Place> buildPlaces(placesListSnapshot,user)  => cloudfirestoreRepository.buildPlaces(placesListSnapshot,user);
  
  //CLASE 55
  Future likePlace(Place place, String uid) => cloudfirestoreRepository.likePlace(place, uid);

  
  //Metodo de clase 57, para traer nombre y descripicón de cada lugar en la aplicación

  StreamController<Place> placeSelectedStreamController=StreamController<Place>.broadcast();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink => placeSelectedStreamController.sink;



  void asyncvalid(String uid) async {
    var data = FirebaseFirestore.instance.collection(CloudFirestoreAPI().USERS)
    .where("uid",isEqualTo: uid).get();

    data.then((value) => {
      print("***************sfdasdfasdfas*>>>>>>>>>>>>>>>>>>>>>>>>>>>SFdfs>>>>>>>>>>>"),
      
      print(value.docs.isEmpty),
      print(value.docs)
    });

    var data2 = FirebaseFirestore.instance.collection(CloudFirestoreAPI().USERS)
    .where("uid",isEqualTo: "uid").get();

    data2.then((value) => {
      print(value.docs),
      print(value.docs.isEmpty)
    });

  }

  Stream<QuerySnapshot> myPlacesListStream(String uid){    
    return FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES)
    .where("userOwner",isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().USERS}/${uid}"))
    .snapshots();
  }

  Future<UploadTask> uploadFile(String path, File image) => firebaseStorageRepositoryPlace.uploadFile(path,image);


  signOut ()=> auth_repository.signOut();
  

  @override
  void dispose() {
    placeSelectedStreamController.close();
  }

}