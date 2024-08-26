import 'package:ecommerce_app2/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser()async{
    return await auth.currentUser;
  }

  Future SignOut()async{
    await FirebaseAuth.instance.signOut();
  }

  // Future deleteUser()async{
  //   User? user= await FirebaseAuth.instance.currentUser;
  //   user?.delete();
  // }

  Future<void> reauthenticateUser(BuildContext context ,String? email, String? password) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;

  if (user != null) {
    AuthCredential credential = EmailAuthProvider.credential(email: email!,password: password!);
    
    try {
      // Re-authenticate the user
      await user.reauthenticateWithCredential(credential);
      print('User re-authenticated successfully');
      user.delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Account Deleted Successfully')));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    } catch (e) {
      print('Error re-authenticating user: $e');
      // Handle re-authentication error (e.g., show an alert to the user)
    }
  }
}
}