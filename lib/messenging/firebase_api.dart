import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final firebasemessanging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await firebasemessanging.requestPermission();
    final fCMToken = await firebasemessanging.getToken();
    print('token $fCMToken');
  }
}
