import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:todo_db_provider/data/firestore_helper.dart';

class StorageHelper {
  static StorageHelper storageHelper = StorageHelper();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> uplodeimage(File file) async {
    String filename = file.path.split("/").last;
    Reference reference = firebaseStorage.ref("image/$filename");
    TaskSnapshot taskSnapshot = await reference.putFile(file);
    String imageUri = await reference.getDownloadURL();
    return imageUri;
  }
}
