import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:game_x/auth.dart';

//import 'package:game_x/auth_provider.dart';
//import 'package:game_x/home_page.dart';

class VerifyEmail extends StatelessWidget{

  const VerifyEmail({this.onSignedOut});

  final VoidCallback onSignedOut;

  @override
  Widget build(BuildContext context) {
      

    return  Scaffold(
      appBar: AppBar(
        title: Text('Verify your email'),
        backgroundColor: Colors.black,
      ),

      
        body:  Center(
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
                    Icons.settings,
                    color: Colors.white,
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