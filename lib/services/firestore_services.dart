import 'package:emart_project/consts/consts.dart';

class FireStoreServices {
  //get user data
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
