import 'package:ecommerce_app2/Pages/login_page.dart';
import 'package:flutter/material.dart';

class EmailSent extends StatefulWidget {
  final String email;
  const EmailSent({super.key,
  required this.email});

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left:30,right:30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/emailsent.gif',
            height: 200,
           //width: 300,
           ),
           
           Text('Email sent!',
                  style: TextStyle(
           wordSpacing: 2,
           color: Colors.black,
           fontSize: 40,
           fontWeight: FontWeight.bold,
           fontFamily: "Poppins"
                         )),
                 
                  const SizedBox(height: 10,),
                  Text('We have sent an email to \n ${widget.email} with a link to \nreset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
           fontSize: 18,
           color: Colors.black45,
           fontWeight: FontWeight.bold,
           fontFamily: "Poppins"
                         ),),

         GestureDetector(
           onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
           },
           child: Container(
                    height: 65,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top:30),
                     padding: EdgeInsets.only(right:MediaQuery.of(context).size.width/50),
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFFD70F64),
                    ),
                    child:  Center(
                      child: Text('Go to Login Page',
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18
                        ),),
                    ),
                       ),
         ),
                            
                    ],
                  ),
       
                      ),
          
    );
  
  }
}