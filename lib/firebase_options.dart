import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default Firebase configuration options for the app.
///
/// This is a placeholder file. For production, you would run:
/// `flutterfire configure`
/// to generate the actual configuration for your Firebase project.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Placeholder configuration - replace with actual Firebase project values
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'placeholder_api_key',
    appId: '1:000000000000:web:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'midsem-exam-placeholder',
    authDomain: 'midsem-exam-placeholder.firebaseapp.com',
    storageBucket: 'midsem-exam-placeholder.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'placeholder_api_key',
    appId: '1:000000000000:android:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'midsem-exam-placeholder',
    storageBucket: 'midsem-exam-placeholder.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'placeholder_api_key',
    appId: '1:000000000000:ios:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'midsem-exam-placeholder',
    storageBucket: 'midsem-exam-placeholder.appspot.com',
    iosBundleId: 'com.example.midsemExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'placeholder_api_key',
    appId: '1:000000000000:macos:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'midsem-exam-placeholder',
    storageBucket: 'midsem-exam-placeholder.appspot.com',
    iosBundleId: 'com.example.midsemExam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'placeholder_api_key',
    appId: '1:000000000000:windows:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'midsem-exam-placeholder',
    storageBucket: 'midsem-exam-placeholder.appspot.com',
  );
}
