import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

class StorageMethod {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(String name, File file) async {
    Reference ref = _storage.ref().child(name).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}


//오늘의 뻘짓 반성.
 // 코드를 잘 보자. Auth를 받아야 하는데,  메서드를 storage로 만들어 놓으니까 오류가 생기지


 