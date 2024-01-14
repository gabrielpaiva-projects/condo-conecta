import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBfXO38PUlZ7NS1Qljtw67kCfhoolz8vyg",
            authDomain: "condo-conecta-app.firebaseapp.com",
            projectId: "condo-conecta-app",
            storageBucket: "condo-conecta-app.appspot.com",
            messagingSenderId: "13110257505",
            appId: "1:13110257505:web:65ce507be10765785b4720"));
  } else {
    await Firebase.initializeApp();
  }
}
