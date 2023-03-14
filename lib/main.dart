import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaunt/utilities/route/router.dart';
import 'package:jaunt/utilities/route/routes.dart';
import 'package:jaunt/view_model/data/remot/dio/dio_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(

             /* theme: ThemeData(
                fontFamily: 'Montserrat',
                  textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold

                ),
              ),
              ),*/
              debugShowCheckedModeBanner: false,
              onGenerateRoute: onGenerate,
              initialRoute: AppRoutes.splashScreenRoute,
              //   home: LoginPage()
            );
          });

  }
}
