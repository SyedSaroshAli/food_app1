
//import 'package:ecommerce_app/widgets/neu.dart';

import 'package:ecommerce_app2/Pages/detailsPage.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:ecommerce_app2/widgets/neu2.dart';
import 'package:flutter/material.dart';

class FoodMenu extends StatelessWidget {
final String imagePath;
  final String title;
  final String subtitle;
  final String price; 
  const FoodMenu({super.key, required this.imagePath, required this.title, required this.subtitle, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:14,bottom:10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage()));
        },
        child: NeuBox2(
          child: Container(
            height: 130,
            padding: EdgeInsets.only(top:3),        
             child: Row(
              children: [
                Image.asset(imagePath,
                height: 150,
                width: 150,),
                
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                      style: BoldTextClass.semiBoldText(),),
                      
                      const SizedBox(height: 3,),
                      Text(subtitle,
                      style: BoldTextClass.LightboldText(),),

                      const SizedBox(height: 3,),
                      Text('\$$price',
                      style: BoldTextClass.semiBoldText(),)
                      ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}