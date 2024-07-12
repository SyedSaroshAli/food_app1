import 'package:ecommerce_app2/Pages/onboarding_screen.dart';
import 'package:ecommerce_app2/Pages/onboarding_screen2.dart';
import 'package:ecommerce_app2/Pages/onboarding_screen3.dart';
import 'package:ecommerce_app2/Pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  //controller to keep track on which page we are on
  PageController _controller = PageController();
  bool onLastPage = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [PageView(
          controller: _controller,
          onPageChanged: (index){
            setState(() {
              onLastPage = (index==2);
            });
          },
          children: [
            OnBoardingSreen1(),
            OnBoardingSreen2(),
            OnBoardingSreen3(),
          ],
        ),
         
        Container(
          padding: EdgeInsets.only(bottom: 60),
          alignment: Alignment(0, 0.6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(controller: _controller, count: 3),
          
            const SizedBox(height: 30,), 

            onLastPage? 

            GestureDetector(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
             },
             child:
               Container(
                padding: EdgeInsets.symmetric(horizontal: 88,vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD70F64),
                ),
                child: Text('Get Started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold 
                ),),
              ))
            :GestureDetector(
              onTap: (){
                _controller.nextPage(
                  duration: Duration(milliseconds: 300),
                   curve: Curves.easeIn);
              },
             child : Container(
                padding: EdgeInsets.symmetric(horizontal: 120,vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD70F64),
                ),
                child: Text('Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold 
                ),),
              ),
            )  
            ],
          ),
        )
        ]
      ),
    );
  }
}