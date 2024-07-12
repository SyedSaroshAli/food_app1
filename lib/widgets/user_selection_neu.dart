import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:ecommerce_app2/widgets/neu2.dart';
import 'package:flutter/material.dart';


class UserChoiceNeu extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price; 
  const UserChoiceNeu({super.key, required this.title, required this.subtitle, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.symmetric(vertical: 14,horizontal: 10),
      child: NeuBox2(
                      child: Padding(
                        padding: const EdgeInsets.only(top:8.0,left:8,right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imagePath,
                            height: 100,
                            width: 140,),
                    
                            Text(title,
                            style: BoldTextClass
                            .semiBoldText(),
                            ),
                            
                            SizedBox(height: 3,),
                            Text(subtitle,
                            style: BoldTextClass.LightboldText()),
                
                            SizedBox(height: 3,),
                            Text('\$$price',
                            style: BoldTextClass.semiBoldText(),)
                          ],
                        ),
                      ),
                    ),
    );
  }
}


