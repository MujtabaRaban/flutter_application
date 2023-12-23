# flutter_application_1
 SWE463_Group 1 - E-sport mobile application

 1. Create a Firebase Project

    Go to the Firebase Console.
    Click on "Add Project" and follow the instructions to create a new Firebase project.
    Remember the project name; you'll need it later for configuration.

2. Register Your App with Firebase

    In the Firebase Console, open the project you just created.
    Click on the 'iOS' or 'Android' icon to add a new app. For web or other platforms, select the appropriate icon.
        For Android, use your Android package name.
        For iOS, use your iOS bundle ID.
    Follow the instructions to register your app.

3. Add Firebase Configuration File

    At the end of the app registration process, you'll download a configuration file.
        For Android: google-services.json.
        For iOS: GoogleService-Info.plist.
    Place the configuration file in your Flutter project:
        For Android, put google-services.json into the android/app/ directory.
        For iOS, use Xcode to open the ios/Runner.xcworkspace file and drag GoogleService-Info.plist into it, under the Runner project.

4. Add Firebase to Your Flutter App

    Add Firebase Core to your pubspec.yaml file:

    yaml

dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^latest_version

Install it by running:

bash

    flutter pub get

5. Initialize Firebase

In your main Dart file (usually main.dart), import Firebase and initialize it:

dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Your app content
    );
  }
}

6. Add Firebase Plugins

Depending on what Firebase services you want to use (like Firestore, Authentication, etc.), add the corresponding plugins to your pubspec.yaml file. For example, for Firestore:

yaml

dependencies:
  cloud_firestore: ^latest_version

And run flutter pub get again.

7. Use Firebase Services

Now, you can start using Firebase services in your app. Here's a simple example of using Firestore:

dart

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore.instance.collection('users').doc('user_id').get().then((DocumentSnapshot documentSnapshot) {
  if (documentSnapshot.exists) {
    print('Document data: ${documentSnapshot.data()}');
  } else {
    print('Document does not exist on the database');
  }
});

8. Configure Platform-Specific Settings

    For Android, update your android/build.gradle and android/app/build.gradle files as instructed by Firebase documentation.
    For iOS, you might need to configure specific settings in Xcode related to your Firebase services.

9. Run and Test

Run your app and test to ensure Firebase is correctly integrated and working as expected.
Additional Tips

    Always refer to the latest Firebase documentation for the most up-to-date instructions.
    If you encounter issues, check your build logs for errors and refer to the Firebase and Flutter communities for support
