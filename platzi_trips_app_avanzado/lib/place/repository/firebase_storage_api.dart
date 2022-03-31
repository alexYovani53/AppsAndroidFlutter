import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI{
  Reference storageReference = FirebaseStorage.instance.ref();

  Future<UploadTask> uploadFile(String path, File image) async{
    UploadTask uploadTask = storageReference.child(path).putFile(image);

    return uploadTask;
  }
}