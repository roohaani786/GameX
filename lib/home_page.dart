//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:testapp/auth.dart';

import 'package:testapp/auth_provider.dart';

//import 'package:game_x/payments/paytm.dart';
//import 'package:game_x/login_page.dart';




class HomePage extends StatelessWidget {

  const HomePage({this.onSignedOut});

  final VoidCallback onSignedOut;



  Future<void> _signOut(BuildContext context) async {

    try {

      final BaseAuth auth = AuthProvider.of(context).auth;

      await auth.signOut();

      onSignedOut();

    } catch (e) {

      print(e);

    }

  }

  // Future<void> _verifyemail(BuildContext context) async {

  //   try {

  //    final BaseAuth auth = AuthProvider.of(context).auth;

  //     await auth.verifyemail();

      

  //   } catch (e) {

  //     print(e);

  //   }

  // }


  


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,

      home: DefaultTabController(
        length: 3,
      
    child: Scaffold(

      appBar: AppBar(

        bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.rss_feed)),
                Tab(icon: Icon(Icons.account_balance_wallet)),
              ],
            ),
        

        title: Text('Welcome To GameX',),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        
        

        actions: <Widget>[

          FlatButton(

           // child: Text('', style: TextStyle(fontSize: 17.0, color: Colors.white)),
           child: IconButton(icon: new Icon(Icons.monetization_on,),color: Colors.greenAccent,onPressed: () => _signOut(context),),
           
  
            onPressed: () => HomePage(),

          )


         

          
        ],

        

        //  + (_verifyemail(context) == null ? [FlatButton(

        //     child: Text('verify email', style: TextStyle(fontSize: 17.0, color: Colors.white)),

        //     onPressed: () => _verifyemail(context),

        //   ),] : []),

      ),

    

    drawer: new Drawer(

        child: new ListView(

          padding: const EdgeInsets.only(top: 0.0),
          
        

          children: <Widget>[

            new UserAccountsDrawerHeader(

              accountName: Text("Aman Khan"),

              accountEmail: Text("amankanaa@gmail.com"),

              currentAccountPicture: new CircleAvatar(

                backgroundColor: Colors.deepPurple,

                child: new Text("GameX",style: TextStyle(color:Colors.white),),

              ),

              otherAccountsPictures: <Widget>[

                new GestureDetector(

                  onTap: () => _onTapOtherAccounts(context),

                  

                )

	            ]

            ),

            new ListTile(

              leading: new Icon(Icons.account_balance_wallet),

              title: new Text('My Wallet'),

              onTap: () => _onListTileTap(context),

            ),

            new Divider(),

           

            new ListTile(

              leading: new Icon(Icons.play_for_work),

              title: new Text('Tournaments'),

              onTap: () => _onListTileTap(context),

            ),

            new ListTile(

              leading: new Icon(Icons.branding_watermark),

              title: new Text('My Tournaments'),

              onTap: () => _onListTileTap(context),

            ),

            new ListTile(

              leading: new Icon(Icons.people_outline),

              title: new Text('Host Tournaments'),

              onTap: () => _onListTileTap(context),

            ),

            new ListTile(

              leading: new Icon(Icons.play_arrow),

              title: new Text('Play for Free'),

              onTap: () => _onListTileTap(context),

            ),

          
         

            new Divider(),

            new ListTile(

              leading: new Icon(Icons.settings),

              title: new Text('Settings'),

              onTap: () => _onListTileTap(context),

            ),

            new ListTile(

              leading: new Icon(Icons.help),

              title: new Text('Help & feedback'),

              onTap: () => _onListTileTap(context),

            ),

            new ListTile(

              leading: new Icon(Icons.exit_to_app),

              title: new Text('Logout'),

              onTap: () => _signOut(context),

            ),

          ]

        )

      ),

      

      body: new Center(

        child: new Text('Hello World!')

      ),

    ),
      ),
    );

  }



  _onTapOtherAccounts(BuildContext context) {

    Navigator.of(context).pop();

    showDialog<Null>(

      context: context,

     

    );

  }



  _onListTileTap(BuildContext context) {

    Navigator.of(context).pop();

    showDialog<Null>(

      context: context,

      

     
      
    
    );

  }

}