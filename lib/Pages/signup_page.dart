import 'package:cloud_firestore_odm/annotation.dart';
import 'package:ecommerce_app2/Pages/login_page.dart';
import 'package:ecommerce_app2/services/database.dart';
import 'package:ecommerce_app2/services/shared_pref.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:ecommerce_app2/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String email='',password='',name='';
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration ()async{
    try{
      if(password!=null){
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            'Registered',
            style: TextStyle(fontSize: 20,color: Colors.white),)));
         
          String id = randomAlphaNumeric(10);
          Map<String, dynamic> addUserInfo ={
            'Name': nameController.text,
            'Email': emailController.text,
            'Wallet': '0',
            'id':id, 
            
          };
          await DatabaseMethods().addUserDetail(addUserInfo, id);
          await SharedPreferenceHelper().saveUserName(nameController.text);
          await SharedPreferenceHelper().saveUserEmail(emailController.text);
          await SharedPreferenceHelper().saveUserWallet('0');
          await SharedPreferenceHelper().saveUserId(id);
          await SharedPreferenceHelper().saveUserPassword(passController.text);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigator()));
      }
    } on FirebaseException catch(e){
     if(e.code=='weak-password'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFFD70F64),
        content: Text(
          'Password is too weak',
          style: TextStyle(fontSize: 18,color: Colors.white),)));
     }
      if(e.code=='invalid-email' && emailController.text.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor:Color(0xFFD70F64),
          content: Text(
            'Please write a valid email',
            style: TextStyle(fontSize: 18,color: Colors.white))));}

     if(e.code=='email-already-in-use'){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor:Color(0xFFD70F64),
          content: Text(
            'Account already exists',
            style: TextStyle(fontSize: 18,color: Colors.white),)));
     }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
           Container(
          height: MediaQuery.of(context).size.height/2.5,
          width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFFD70F64)
            ),
           ),

           Container(
            margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/3),
            height: MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30))
            ),
            child: Text(''),
           ),

           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top:60),
                 child: Column(
                  children: [
                    Center(child: Image.asset('assets/logo.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width/1.5,))
                  ],
                 ),
               ),
               
               Padding(
                 padding: EdgeInsets.only(left: 20,right: 20,top:MediaQuery.of(context).size.height/18),
                 child: Material(
                   elevation: 5,
                   borderRadius: BorderRadius.circular(30),
                   child: Container(
                     padding: EdgeInsets.only(left:30,right:30),
                     height: MediaQuery.of(context).size.height/1.59,
                     width: MediaQuery.of(context).size.width/1.1,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: Colors.white,
                     ),
                     child: Form(
                       key: _formkey,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [ 
                           SizedBox(height: 20,),
                            Center(
                              child: Text("Sign Up",
                              style: BoldTextClass.DarkboldTextLarge(),),
                            ),
                            
                            //  SizedBox(height: MediaQuery.of(context).size.height/70),
                            Spacer(),
                            Text('Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                            ),),
                            
                            SizedBox(height: 5,),
                            TextFormField(
                              controller: nameController,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return 'Please enter your name ';
                                }
                                return null;
                              },     
                              decoration: InputDecoration(  
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                     color: Colors.grey,
                                     width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Color(0xFFD70F64),
                                  width: 3,
                                ),),
                                prefixIcon: Icon(Icons.person_outlined),
                                 focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),),
                                hintStyle: BoldTextClass.LightboldText(),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),),
                              ),
                  
                               
                              
                              ),
                         
                            
                       
                       
                            // SizedBox(height:  MediaQuery.of(context).size.height/100,),
                            Spacer(),
                            Text('Email',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                            ),),
                            
                            SizedBox(height: 5,),
                            TextFormField(
                              controller: emailController,
                              validator: (value){
                                 if(value==null || value.isEmpty){
                                  return 'Please enter Email ';
                                }
                                return null;
                              },     
                              decoration:  InputDecoration(  
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                     color: Colors.grey,
                                     width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Color(0xFFD70F64),
                                  width: 3,
                                ),),
                                prefixIcon: Icon(Icons.email_outlined),
                                 focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),),
                                hintStyle: BoldTextClass.LightboldText(),
                               errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),),
                              ),),
                               
                                // hintStyle: BoldTextClass.LightboldText(),
                              
                              
                            
                                      
                            // SizedBox(height: MediaQuery.of(context).size.height/100,),
                            Spacer(),
                            Text('Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                            ),),
                                      
                            SizedBox(height: 5,),
                            TextFormField(
                              controller: passController,
                              validator: (value){
                                 if(value==null || value.isEmpty){
                                  return 'Please enter password ';
                                }
                                return null;
                              },
                              obscureText: true,
                               decoration:  InputDecoration(  
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                     color: Colors.grey,
                                     width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Color(0xFFD70F64),
                                  width: 3,
                                ),),
                                prefixIcon: Icon(Icons.password_outlined),
                                 focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),),
                                hintStyle: BoldTextClass.LightboldText(),
                                 errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),),
                              ),),
                            
                       
                                      
                            Spacer(flex: 4,),       
                            Center(
                              child: GestureDetector(
                                onTap: (){
                                  print('hello');
                                  if(_formkey.currentState!.validate()){
                                    name = nameController.text;
                                    email=emailController.text;
                                    password=passController.text;
                                  }
                                  registration();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom:20),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD70F64),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text('SIGN UP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                    ),),
                                  ),
                                ),
                              ),
                            )
                         ],
                       ),
                     ),
                   ),
                 ),
               ),

                SizedBox(height: MediaQuery.of(context).size.height/20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey.shade500
                          )),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                            },
                            child: Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFD70F64)
                            )),
                          ),
                        ],
                      ),
             ],
             
             
           ),
                  
        ],
      )
    );
  }
}

// import 'package:flutter/material.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }