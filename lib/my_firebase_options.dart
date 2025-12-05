import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: 'AIzaSyDp2dofx_F9_p7PVaxXcjWlhxLwcRtF19o',
        appId: '1:1092303341508:web:9a25309386ec575569c691',
        messagingSenderId: '1092303341508',
        projectId: 'meap-games',
        authDomain: 'meap-games.firebaseapp.com',
        storageBucket: 'meap-games.firebasestorage.app',
      );
    }
    return const FirebaseOptions(
      apiKey: 'AIzaSyDp2dofx_F9_p7PVaxXcjWlhxLwcRtF19o',
      appId: '1:1092303341508:android:9a25309386ec575569c691',
      messagingSenderId: '1092303341508',
      projectId: 'meap-games',
      storageBucket: 'meap-games.firebasestorage.app',
    );
  }
}
