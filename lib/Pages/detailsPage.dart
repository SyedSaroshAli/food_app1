import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int a =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.only(left:20,right: 20,top: 50),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black,),
            ),

            Image.asset('assets/burger.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width/1.2,
            fit: BoxFit.fill,),

            const SizedBox(height: 15,),
            Row(
              
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mediterian',
                    style: BoldTextClass.semiBoldText(),),

                    Text('Chikpea Salad',
                    style: BoldTextClass.DarkboldTextLarge(),)
                  ],
                ),
                
                Spacer(),
                GestureDetector(
                  onTap: (){
                    if(a>1){
                        a--;
                        setState(() {
                          
                        });
                    }   
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black
                    ),
                    child: Icon(Icons.remove,
                    color:  Colors.white,),
                  ),
                ),
                
                const SizedBox(width: 10,),
                Text(a.toString(),
                style: BoldTextClass.semiBoldText(),),
                
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    a++;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black
                    ),
                    child: Icon(Icons.add,
                    color:  Colors.white,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: BoldTextClass.LightboldText(),),

            const SizedBox(height: 30,),
            Row(
              children: [
                Text('Delivery Time',
                style:BoldTextClass.semiBoldText(),),
                
                const SizedBox(width: 25,),
                Icon(Icons.alarm,color: Colors.black54),

                const SizedBox(width: 5,),
                Text('30 min',
                style: BoldTextClass.semiBoldText())
              ],
            ),

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom :40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price',
                      style: BoldTextClass.semiBoldText()),
              
                      Text('\$28',
                      style: BoldTextClass.DarkboldTextLarge(),)
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Add To Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),),
                        
                        SizedBox(width: 50,),
                        Icon(Icons.shopping_cart_outlined,
                        color: Colors.white,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
         ),
       )
    );
  }
}