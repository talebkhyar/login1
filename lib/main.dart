import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:login1/firebase_options.dart';
import 'package:login1/pages/home.dart';
import 'package:login1/share/snackbar.dart';
import 'login.dart';




 Future<void> main() async {
  
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
     );
    runApp(const MainApp());
 }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(32, 63, 129, 1.0),
        ),
      ),
      home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              } else if (snapshot.hasData) {
                // return VerifyEmailPage();
                return const Home(); // home() OR verify email
              } else {
                return const Login();
              }
            },
          ),
      // initialRoute: '/login',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.

      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/login': (context) => const Login(),
      //   '/home': (context) => const Home(),
      //   '/singin': (context) => const Signup(),
      // },
      
    );
    // ignore: dead_code
  
  }
}



