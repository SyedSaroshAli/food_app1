import 'package:ecommerce_app2/Pages/detailsPage.dart';
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
      margin:const  EdgeInsets.symmetric(vertical: 6,horizontal: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(imageUrl: imagePath, details: subtitle, price: price, title: title)));
        },
        child: NeuBox2(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(imagePath,
                              fit: BoxFit.cover,
                              height: 120,
                              width: double.infinity,),
                            ),
                            
                            SizedBox(height: 5,),
                            Text(title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                            )
                            ),
                            
                        
                            
                                        
                            SizedBox(height: 2,),
                            Text('\$'+price,
                            style: BoldTextClass.semiBoldText(),)
                          ],
                        ),
                      ),
      ),
    );
  }
}


