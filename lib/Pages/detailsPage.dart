import 'package:ecommerce_app2/services/database.dart';
import 'package:ecommerce_app2/services/shared_pref.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailsPage extends StatefulWidget {
 final String imageUrl;
 final String details;
 final  String price; 
 final String title;

  const DetailsPage({super.key, required this.imageUrl, required this.details, required this.price, required this.title});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int a =1;
  double total=0;
  String? id;
  
  getTheSharedPref()async{
    id = await SharedPreferenceHelper().getUserId();
    setState(() {
      
    });
  }
  
  onTheLoad ()async{
    await getTheSharedPref();
    setState(() {
      
    });
  }
  @override
  void initState() {
    total=double.parse(widget.price);
    onTheLoad();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Padding(
         padding: const EdgeInsets.only(left:20,right: 20,top: 50),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
  children: [
    Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
      ),
    ),
    Align(
      alignment: Alignment.center,
      child: Text(
        'Item Details',
        textAlign: TextAlign.center,
        style: BoldTextClass.DarkboldTextLarge(),
      ),
    ),
  ],
),

            // Row(
        
            //   children: [
            //     GestureDetector(
            //       onTap: (){
            //         Navigator.pop(context);
            //       },
            //       child: Icon(Icons.arrow_back_ios_new_outlined,
            //       color: Colors.black,),
            //     ),

            //     Text('Item Details',
            //     textAlign: TextAlign.center,
            //     style: BoldTextClass.DarkboldTextLarge(),)
            //   ],
            // ),
            
            SizedBox(height: MediaQuery.of(context).size.height/25,),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(widget.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/1.2,
              fit: BoxFit.fill,),
            ),

            const SizedBox(height: 15,),
            Row(
              
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                    style: BoldTextClass.DarkboldTextLarge(),)
                  ],
                ),
                
                Spacer(),
                GestureDetector(
                  onTap: (){
                    if(a>1){
                        a--;
                     setState(() {
                      total= total-double.parse(widget.price);
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
                      total= total+double.parse(widget.price);
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
            Text(widget.details,
            style: BoldTextClass.LightboldText(),),

            Spacer(flex: 5,),
            Padding(
              padding: const EdgeInsets.only(bottom : 4),
              child: Row(
                children: [
                  Text('Delivery Time',
                  style:BoldTextClass.LightboldText(),),
                  
                  const SizedBox(width: 25,),
                  Icon(Icons.alarm,color: Colors.black54),
              
                  const SizedBox(width: 5,),
                  Text('30 min',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ))
                ],
              ),
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
              
                      Text('\$${total.toStringAsFixed(2)}',
                      style: BoldTextClass.DarkboldTextLarge(),)
                    ],
                  ),

                  GestureDetector(
                    onTap: ()async{
                     Map<String,dynamic> addFoodToCart = {
                       'Name': widget.title,
                       'Quantity': a.toString(),
                       'Total':total.toString(),
                       'Image':widget.imageUrl
                     };
                    await DatabaseMethods().addFoodToCart(addFoodToCart, id!);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar( 
                     backgroundColor: Color(0xFFD70F64), 
                     content:
                     Text('Food added to cart',
                     style: TextStyle(
                      color: Colors.white
                     ),) ));
                    }, 
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFD70F64),
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
                          
                          SizedBox(width: MediaQuery.of(context).size.width/10,),
                          Icon(Icons.shopping_cart_outlined,
                          color: Colors.white,),
                        ],
                      ),
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