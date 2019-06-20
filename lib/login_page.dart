import 'package:flutter/material.dart';

import 'package:testapp/auth.dart';

import 'package:testapp/auth_provider.dart';



class EmailFieldValidator {

  static String validate(String value) {

    return value.isEmpty ? 'Email can\'t be empty' : null;

  }

}



class PasswordFieldValidator {

  static String validate(String value) {

    return value.isEmpty ? 'Password can\'t be empty' : null;

  }

}



class LoginPage extends StatefulWidget {

  const LoginPage({this.onSignedIn});

  final VoidCallback onSignedIn;



  @override

  State<StatefulWidget> createState() => _LoginPageState();

}



enum FormType {

  login,

  register,

}



class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  String _email;

  String _password;

  FormType _formType = FormType.login;



  bool validateAndSave() {

    final FormState form = formKey.currentState;

    if (form.validate()) {

      form.save();

      return true;

    }

    return false;

  }



  Future<void> validateAndSubmit() async {

    if (validateAndSave()) {

      try {

        final BaseAuth auth = AuthProvider.of(context).auth;

        if (_formType == FormType.login) {

          final String userId = await auth.signInWithEmailAndPassword(_email, _password);

          

          print('Signed in: $userId');

        } else {

          final String userId = await auth.createUserWithEmailAndPassword(_email, _password);

          print('Registered user: $userId');

        }

        widget.onSignedIn();

      } catch (e) {

        print('Error: $e');

      }

    }

  }



  void moveToRegister() {

    formKey.currentState.reset();

    setState(() {

      _formType = FormType.register;

    });

  }



  void moveToLogin() {

    formKey.currentState.reset();

    setState(() {

      _formType = FormType.login;

    });

  }

  


  @override
  

  Widget build(BuildContext context) {
    

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
      

      appBar: AppBar(

        title: Text('             Welcome To GameX       ',),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.deepPurple,

        
  
      ),

      
      

      body: Container(
        

        
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 130,bottom: 78,left: 20,right: 20),
              

        child: Form(


          key: formKey,

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: buildInputs() + buildSubmitButtons(),

          ),

        ),

      ),

    );

  }

  


  List<Widget> buildInputs() {

    return <Widget>[

      

      TextFormField(



        key: Key('email'),

        //decorating hint text

        decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(fontSize: 14.0,
          color: Colors.tealAccent
        )),

        //Validating If email is ok

        validator: EmailFieldValidator.validate,

        //Saving the value of email

        onSaved: (String value) => _email = value,
        keyboardType: TextInputType.emailAddress,

        //Decorating Input Text

        style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.w400),
        textInputAction: TextInputAction.next,
        

        //autofocus: true,

      ),

      TextFormField(

        key: Key('password'),

        //Decorating hint text

        decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(fontSize: 14.0,
          color: Colors.tealAccent
        )),

        //Hiding the input password

        obscureText: true,

        //Done keyboard button

        textInputAction: TextInputAction.done,

        //Styling the input Text

        style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.w400),

        //Validating If Password Is ok

        validator: PasswordFieldValidator.validate,

        //Saving the value of Password

        onSaved: (String value) => _password = value,
        //keyboardType: TextInputType.text,

      ),

    ];

  }

   



  List<Widget> buildSubmitButtons() {

    if (_formType == FormType.login) {

      return <Widget>[
       

        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),


        RaisedButton(

          key: Key('signIn'),

          padding: EdgeInsets.only(bottom: 5.0),
          

          child: Text('Login', style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.center,),
          color: Colors.green,
          

          onPressed: validateAndSubmit,

        ),

        Padding(
          padding: EdgeInsets.only(top: 3.0),
        ),

        FlatButton(

          child: Text('Forgot password?', style: TextStyle(fontSize: 15.0)),

          onPressed: moveToRegister,

        ),

      
      

        // Padding(
        //   padding: EdgeInsets.only(top: 1.0),
        // ),

        FlatButton(

          child: Text('New User? Create Account', style: TextStyle(fontSize: 15.0)),

          onPressed: moveToRegister,

        ),

      ];

    } else {

      return <Widget>[

         Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),


        RaisedButton(

           padding: EdgeInsets.only(bottom: 5.0),

           

          child: Text('Sign Up', style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.center,),
          color: Colors.green,
          
          onPressed: validateAndSubmit,

        ),

        
        FlatButton(
         

          child: Text('Have an account? Login', style: TextStyle(fontSize: 15.0)),

          onPressed: moveToLogin,

        ),

      ];

    }

  }

}