import 'package:ecommerce_app2/Pages/emailsent_Page.dart';
import 'package:ecommerce_app2/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email='';
  final _formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();

  resetPassword () async{
    // try{
    //    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const EmailSent()));
    // } catch (e){
    //   print(e.toString());
      // if(e.code=='user-not-found'){
      //   print (e.code);
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   backgroundColor:  Color(0xFFD70F64),
        //   content: Text('No user found for that email',
        //   style:TextStyle(
        //     fontSize: 18,
        //     color: Colors.white
        //   ) ,)));
      // }
   // }
    auth.sendPasswordResetEmail(email: email).then((value){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> EmailSent(email: email)));
    }).onError((error,stackTrace){      
       if(error.toString()=='[firebase_auth/invalid-email] The email address is badly formatted.'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFFD70F64),
        content: Text(
          'Please write valid email',
          style: TextStyle(fontSize: 16,color: Colors.white),)));
      }
    });
      
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
       body : Padding(
         padding: const EdgeInsets.only(top:40,left: 20,right: 20),
         child: Form(
          key: _formkey,
           child: Column(
             crossAxisAlignment:  CrossAxisAlignment.center,
             children: [
               Center(
                 child: Image.asset('assets/forgetpasswordlogo.png',
                 height: MediaQuery.of(context).size.height/3.5,
                 width: 300,),
               ),
           
               Text('Forgot Password?',
               textAlign: TextAlign.center,
               style: TextStyle(
                wordSpacing: 2,
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins"
               )),
               
               const SizedBox(height: 10,),
               Text('Don\'t worry, happens to the best of us.\nType your email to reset your password.',
               textAlign: TextAlign.center,
               style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins"
               ),),
               
               SizedBox(height: MediaQuery.of(context).size.height/25,),
               TextFormField(
                controller: emailController,
                validator: (value){
                  if(value==null || value.isEmpty){
                 return 'Please enter email ';
                   }
                return null;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon: const Icon(Icons.person,color:Colors.black45),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const  BorderSide(
                      color: Color(0xFFD70F64),
                      width: 2
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.8,
                      color: Colors.grey.shade400
                    )
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1.8,
                      color: Colors.red
                    )
                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const  BorderSide(
                      color: Color(0xFFD70F64),
                      width: 2
                    )
                  ),
                ),
               ),

               
               Spacer(),
               GestureDetector(
                onTap: (){
                  if(_formkey.currentState!.validate()){
                     print('called');
                     setState(() {
                       email=emailController.text;
                     });
                     resetPassword();
                  }
                },
                 child: Container(
                  height: 65,
                  width: double.infinity,
                  margin:  EdgeInsets.only(top:MediaQuery.of(context).size.width/20),
                   padding: EdgeInsets.only(right:MediaQuery.of(context).size.width/50),
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFD70F64),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                     
                     SizedBox(width: MediaQuery.of(context).size.width/2.9,),  
                     Text('Send',
                          style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 18
                    ),),
                                       
                            
                      SizedBox(width: MediaQuery.of(context).size.width/4,),
                      Icon(Icons.send,
                      color: Colors.white,),
                            
                    ],
                  ),
                 ),
               ),
              
              SizedBox(height: MediaQuery.of(context).size.height/16,),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Remember Password? ",
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.shade500
                            )
                 ),
                  
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                    },
                    child: Text('Login',
                    style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFD70F64),
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
              Spacer()
             ],
           ),
         ),
       )
    );
  }
}