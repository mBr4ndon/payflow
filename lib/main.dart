import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import 'app_widget.dart';
import 'modules/login/login_page.dart';

void main() {
  runApp(AppFirebase());
}
class AppFirebase extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Material(
            child: Center(
              child: Text(
                "Não foi possível iniciar o Firebase",
                textDirection: TextDirection.ltr
              )
            )
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Material(
          child: Center(
            child: CircularProgressIndicator()
          )
        );
      },
    );
  }
}
