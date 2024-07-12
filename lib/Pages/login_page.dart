import 'package:ecommerce_app2/Pages/forgot_pass_page.dart';
import 'package:ecommerce_app2/Pages/signup_page.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:ecommerce_app2/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  void login() async{
    
    _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password:passwordController.text).then((value){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text('Successfully logged in',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),)));

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigator()));
      }).onError((error,StackTrace){
        debugPrint(error.toString());
        if(error.toString()=='[firebase_auth/invalid-email] The email address is badly formatted.'){
         
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFFD70F64),
        content: Text(
          'Please write valid email',
          style: TextStyle(fontSize: 16,color: Colors.white),)));
      }
      
      if(error.toString()=='[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.'){     
      
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFFD70F64),
        content: Text(
          'Invalid Email or Password',
          style: TextStyle(fontSize: 16,color: Colors.white),)));
      }
      
      });
      
      
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                 padding: EdgeInsets.only(left: 20,right: 20,top:MediaQuery.of(context).size.height/13),
                 child: Material(
                   elevation: 5,
                   borderRadius: BorderRadius.circular(30),
                   child: Container(
                     padding: EdgeInsets.only(left:30,right:30),
                     height: MediaQuery.of(context).size.height/1.9,
                     width: MediaQuery.of(context).size.width/1.1,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: Colors.white,
                     ),
                     child: Form(
                       key: _formKey,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [ 
                           SizedBox(height: 20,),
                            Center(
                              child: 
                              Text("Login",
                              style: BoldTextClass.DarkboldTextLarge(),),
                            ),
                            
                            SizedBox(height: 14,),
                            Text('Email',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                            ),),
                            
                            SizedBox(height: 6,),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Enter your Email";
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
                                prefixIcon: Icon(Icons.alternate_email),
                               
                                hintStyle: BoldTextClass.LightboldText(),
                              
                              ),
                            ),
                                      
                            const SizedBox(height: 18,),
                            Text('Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                            ),),
                                      
                            SizedBox(height: 6,),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter password";
                                }
                                return null;
                              },  
                              obscureText: true,
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
                                prefixIcon: Icon(Icons.password_outlined),
                                
                                hintStyle: BoldTextClass.LightboldText(),
                              
                              ),
                            ),
                            
                            const SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ForgotPassword()));
                                  },
                                  child: Text("Forgot Password?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color:  Color.fromARGB(255, 88, 170, 238)
                                  ),),
                                )
                              ],
                            ),

                            Spacer(),          
                            //SizedBox(height: MediaQuery.of(context).size.height/18),
                                      
                            GestureDetector(
                              onTap: (){
                                if(_formKey.currentState!.validate()){
                                   login();
                                }
                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(bottom:20),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD70F64),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text('LOGIN',
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

                SizedBox(height: 90,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey.shade500
                          )),
                          GestureDetector(
                            onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpPage()));

                            },
                            child: Text("SignUp",
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