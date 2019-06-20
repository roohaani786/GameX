import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';



abstract class BaseAuth {

  Future<String> signInWithEmailAndPassword(String email, String password);

  Future<String> createUserWithEmailAndPassword(String email, String password);

  Future<String> currentUser();

  Future<void> signOut();

  Future<void> verifyemail();

  //Future<String> sendPasswordResetEmail(String email);
  

}



class Auth implements BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  @override

  Future<String> signInWithEmailAndPassword(String email, String password) async {

    final FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    // if (user.isEmailVerified) return user.uid;
    // return null;
  return user.uid;
  }



  @override

  Future<String> createUserWithEmailAndPassword(String email, String password) async {



    final FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    //user.sendEmailVerification();
      if(user.isEmailVerified)
  {
    return user?.uid;
  }
    else{
     
     return user?.uid;

      
    }

  }

 



  @override

  Future<String> currentUser() async {

    final FirebaseUser user = await _firebaseAuth.currentUser();

    return user?.uid;

  }



  @override

  Future<void> signOut() async {

    return _firebaseAuth.signOut();

  }

   Future<void> verifyemail() async {

    final FirebaseUser user = await _firebaseAuth.currentUser();

    try {
        await user.sendEmailVerification();
        return user.uid;
     } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);

    // if(user.isEmailVerified){

    //   return null;
    // }
    // else{

    //   return user?.uid;
    // }

  }

}
}