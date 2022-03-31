
import 'package:platzi_trips_app_avanzado/place/model/place.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'package:platzi_trips_app_avanzado/user/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app_avanzado/user/ui/widgets/profile_place.dart';

class CloudfirestoreRepository {
  final cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(UserM user) => cloudFirestoreAPI.updateUserDAta(user);
  Future<void> updatePlaceData(Place place) => cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(placesListSnapshot) => cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  
  List<Place> buildPlaces(placesListSnapshot,usuario) => cloudFirestoreAPI.buildPlaces(placesListSnapshot,usuario);

  Future likePlace(Place place, String uid) => cloudFirestoreAPI.likePlace(place, uid);

}