import 'package:flutter/material.dart';
import 'package:httpdemo/home/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:httpdemo/login/login_registered_page.dart';

void main(){
  Paint paint = new Paint();
  paint.color = Colors.black26;
  runApp(
    new MaterialApp(
      home: LoginRegisteredPage(),
    )
  );

// new GoogleInDemo().Analytics();



}




class GoogleInDemo {

  final googleSignIn = new GoogleSignIn();
  final analytics = new FirebaseAnalytics();

  void getGoogleUser(){
   GoogleSignInAccount user = googleSignIn.currentUser;
   print('11111'+user.toString());
   print('11111');
  }

  void Analytics(){
    for(int i=0;i<=10;i++){
      analytics.logEvent(name: 'for');
      print(i);
    }
  }


}


