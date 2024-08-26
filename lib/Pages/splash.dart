import 'package:ecommerce_app2/Pages/onboard.dart';
import 'package:flutter/material.dart';





class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
         color:  Color(0xFFD70F64)
         
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
           
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          

             SizedBox(height: MediaQuery.of(context).size.height/30,),
          
          ],
        ),
      ),
    );
  }

  void toTheLoginPage() {
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => Onboard()));
  }

  //initState Function
  @override
 void initState() {
   Future.delayed(Duration(seconds: 3), toTheLoginPage);
   super.initState();
 }
}
