import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_project/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthControllers extends GetxController {
//text controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //login

  Future<UserCredential?> loginMethod(
      {context, String? email, String? passward}) async {
    UserCredential? userCredential;

    try {
      print("dta ${email}");
      print(passward);
      await auth.signInWithEmailAndPassword(email: email!, password: passward!);
    } catch (e) {
      VxToast.show(context, msg: e.toString());
      print("object");
    }
    return userCredential;
  }

  //signup method

  Future<UserCredential?> signUpMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method

  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);

    store.set(
      {
        'name': name,
        'password': password,
        'email': email,
        'imageUrl': '',
        'id': currentUser!.uid,
        'cart_count': "00",
        'order_count': "00",
        'wishlist_count': "00",
      },
    );
  }

  //signout Method
  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
