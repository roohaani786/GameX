import 'package:flutter/material.dart';

import 'package:testapp/auth.dart';

import 'package:testapp/auth_provider.dart';

import 'package:testapp/splash.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return AuthProvider(

      auth: Auth(),

      child: MaterialApp(

        title: 'Flutter login demo',

        theme: ThemeData(

          
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.lightGreenAccent,

          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0,fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0,fontStyle: FontStyle.italic),
          
          )
          //appBarTheme: ThemeData.dark(),

        ),
        
        debugShowCheckedModeBanner: false,

        home: SplashScreen(),

      ),

    );

  }

}