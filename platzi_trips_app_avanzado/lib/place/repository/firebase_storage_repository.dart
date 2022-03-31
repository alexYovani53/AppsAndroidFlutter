
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzi_trips_app_avanzado/place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {

  final FirebaseStorageAPI instanciaAPI = FirebaseStorageAPI();

  Future<UploadTask> uploadFile(String path, File image) => instanciaAPI.uploadFile(path, image);

}