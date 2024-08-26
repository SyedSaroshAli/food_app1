import 'package:ecommerce_app2/Pages/add_food_items_page.dart';
import 'package:ecommerce_app2/Pages/homepage.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/10,left:20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Admin Home',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins"
            ),),
            
            SizedBox(height: MediaQuery.of(context).size.height/18,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFoodItems()));
              },
              child:Stack(
                children: [
                  Container(
                  margin: EdgeInsets.only(left: 50),
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  ),
                  Positioned(
                    left: 4,
                    right: MediaQuery.of(context).size.width/1.6,
                    top: -6,
                    child: Image.asset('assets/burger.png',
                        height: 90,
                        width: 90,),
                  ),
                  
                  Positioned(
                    top: MediaQuery.of(context).size.height/30,
                    right:80,
                    child: Text('Add Food Items',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),),
                  ),

                  
              
                
                
                        ]),
            ),
            
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
              child:Stack(
                children: [
                  Container(
                  margin: EdgeInsets.only(right: 50),
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  ),
                  Positioned(
                    right: 4,
                    left: MediaQuery.of(context).size.width/1.7,
                    top: -6,
                    child: Image.asset('assets/homepage.png',
                        height: 90,
                        width: 90,),
                  ),
                  
                  Positioned(
                    top: MediaQuery.of(context).size.height/30,
                    left:70,
                    child: Text('Go to HomePage',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),),
                  ),

                  
              
                
                
                        ]),
            ),
          ],
        ),
      ),
    );
  }
}