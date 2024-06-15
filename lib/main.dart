import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibreezfb/bloc/login/login_page.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/registration/register_bloc.dart';
import 'bloc/registration/signup_page.dart';
import 'firebase_service/firebase_service.dart';
import 'screens/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   late final FirebaseServices firebaseServices;


   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>RegistrationBloc(FirebaseAuth.instance,
          FirebaseFirestore.instance)),
        BlocProvider(
          create: (context) => LoginBloc(
              firebaseServices
          ),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: '/splash',
          routes: {
            // '/splash': (context) => const SplashScreen(),
            '/homepage': (context) => const Homepage(),
          },
          home: const SignUpPage()),
    );
  }
}
