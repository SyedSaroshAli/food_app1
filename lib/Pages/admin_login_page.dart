import 'package:ecommerce_app2/Pages/admin_home.dart';
import 'package:ecommerce_app2/Pages/login_page.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Color.fromARGB(255, 187, 183, 183),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/4.8),
                  child: Text('ADMIN PANEL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black
                  ),),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/1.8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.elliptical(MediaQuery.of(context).size.width, 120)),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height/2.1,
            padding: EdgeInsets.only(left: 15,right: 15,top: 40),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3.4,left: 25,right: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                     validator: (value){
                      if(value!.isEmpty){
                        return "Enter your username";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.black38
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
              
                      errorBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  TextFormField(
                    controller: passwordController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black38
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
              
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
              
                      errorBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.3,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      if(_formkey.currentState!.validate()){
                        AdminLogin();
                                }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('LOGIN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        
                        ),),
                      ),
                    ),
                  ),
                    Text('Or',
              style: TextStyle(
                color: Colors.grey.shade600
              ),),
                  Padding(
                    padding: const EdgeInsets.only(bottom:10,top:7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login as ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey.shade500
                                    )),
                        GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text("User",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black
                              )),
                  ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  AdminLogin(){
    FirebaseFirestore.instance.collection('Admin').get().then((snapshot){
      snapshot.docs.forEach((result){
        if(result.data()['id']!=usernameController.text.trim()){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(0xFFD70F64),
            content: Text(
              'Your id is not correct',
              style: TextStyle(fontSize: 16,color: Colors.white),)));
        }

        else if(result.data()['password']!=passwordController.text.trim()){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(0xFFD70F64),
            content: Text(
              'Your password is not correct',
              style: TextStyle(fontSize: 16,color: Colors.white),)));
        }

        else{
          Route route = MaterialPageRoute(builder: (context)=> AdminHome());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}