import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testapp/root_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => RootPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // body: Center(
      //   //child: Image.asset('assets/splash.png'),
      //   child: Text("ProjectDoze"),
      body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            new Stack(
              alignment: Alignment.center,
              children: <Widget>[

                new Container(
                  
                   margin: new EdgeInsets.only(right: 20.0, top:10.0, bottom: 40.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Color(0xFF18D191)),
                  child: new Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                ),

                   new Container(
                   margin: new EdgeInsets.only(right: 20.0, top:10.0, bottom: 40.0,left: 90.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Color(0xFF000000)),
                  child: new Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                  ),
                ),

                new Container(
                  margin: new EdgeInsets.only(right: 55.0, top: 60.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Colors.red),
                  child: new Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 30.0, top: 50.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Color(0xFFFFCE56)),
                  child: new Icon(
                    Icons.gamepad,
                    color: Colors.white,
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 110.0, top: 60.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Color(0xFF45E0EC)),
                  child: new Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),
                ),
                
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: new Text(
                    "   GameX ",
                    style: new TextStyle(
                      fontSize: 25.0,color: Colors.white,fontStyle: FontStyle.italic, 
                    ),
                  ),
                ),
                
               
       
              
              ],
              
            ),
            
            ],
        ),
      ),
    );
  }
}