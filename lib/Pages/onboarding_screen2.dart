import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:flutter/material.dart';


class OnBoardingSreen2 extends StatelessWidget {
  const OnBoardingSreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Image.asset('assets/screen2.png',
            height: 350,
            width: MediaQuery.of(context).size.width,
            ),
          ),

          SizedBox(height :MediaQuery.of(context).size.height/20,),
          Text('Easy and Online Payment',
          textAlign: TextAlign.center,
          style : BoldTextClass.DarkboldTextLarge()),

          SizedBox(height: 10,),
          Text('You can pay Cash on Delivery\n And card payment is available',
          textAlign: TextAlign.center,
          style: BoldTextClass.LightboldText(),),

          SizedBox(height: 95,),

          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 120,vertical: 18),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: Color(0xFFD70F64),
          //   ),
          //   child: Text('Next',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontFamily: "Poppins",
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold 
          //   ),),
          // )
        ],

      ),
    );
    }
    }