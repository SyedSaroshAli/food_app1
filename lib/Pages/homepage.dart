// // import 'package:ecommerce_app/Data/data.dart';
// // import 'package:ecommerce_app/widgets/bold_text_widget.dart';
// // import 'package:ecommerce_app/widgets/food_menu.dart';
// // import 'package:ecommerce_app/widgets/neu.dart';
// // import 'package:ecommerce_app/widgets/neu2.dart';
// // import 'package:ecommerce_app/widgets/user_selection_neu.dart';
// // import 'package:flutter/material.dart';

// // class HomePage extends StatefulWidget {
// //    const HomePage({super.key});
 
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //    bool icecream =false;
// //     bool burger=false ; 
// //     bool salad =false; 
// //     bool pizza =false; 
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding:const EdgeInsets.only(left: 14,top:50),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text ("Hello Sarosh",
// //                 style: BoldTextClass.DarkboldText()),

// //                 Container(
// //                   margin: EdgeInsets.only(right: 14),
// //                   padding: EdgeInsets.all(3),
// //                   decoration: BoxDecoration(
// //                   color: Colors.black,
// //                     borderRadius: BorderRadius.circular(10)
// //                   ),
// //                   child: Icon(Icons.shopping_cart_outlined,
// //                   color: Colors.white,),

// //                 )
// //               ],
// //             ),
            
// //             const SizedBox(height: 20,),
// //             Text('Discover Food',
// //             style: BoldTextClass.DarkboldTextLarge()),

// //             Text('Discover and Get Great Food',
// //             style: BoldTextClass.LightboldText(),),
            
// //             const SizedBox(height: 18,),
// //             categoriesRow(),
            
// //             SizedBox(height: 28,),
// //             SizedBox(
// //               height: 250,
// //               width: double.infinity,
// //               child: Expanded(
// //                 child: ListView.builder(
// //                  scrollDirection: Axis.horizontal,
// //                  itemCount: foods1.length,
// //                  itemBuilder: (context,index){
// //                    final food = foods1[index];
// //                    return UserChoiceNeu(
// //                  title: food['title'].toString(),
// //                  subtitle: food['subtitle'].toString(), 
// //                  price: food['price'].toString(), 
// //                  imagePath: food['imageUrl'].toString());
                 
// //                  }),
// //               ),
// //             ),

// //             SizedBox(height: 30,),
// //             Expanded(
// //               child: ListView.builder(
// //                scrollDirection: Axis.vertical,
// //                itemCount: foods2.length,
// //                itemBuilder: (context,index){
// //                  final food2 = foods2[index];
// //                  return FoodMenu(
// //                title: food2['title'].toString(),
// //                subtitle: food2['subtitle'].toString(), 
// //                price: food2['price'].toString(), 
// //                imagePath: food2['imageUrl'].toString());
               
// //                }),
// //             ),
// //           ]
// //             )
// //       )
// //       );
        
    
  
// //   }

// //   Widget categoriesRow(){
// //   return 
// //     Padding(
// //       padding: const EdgeInsets.only(right:18),
// //       child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
                  
// //                   GestureDetector(
// //                     onTap: (){
// //                       burger = true;
// //                       icecream= false;
// //                       salad = false; 
// //                       pizza = false; 
// //                       print('Hello');
                       
// //                       setState(() {
                   
// //                       });
                      
// //                     },
// //                     child:NeuBox(
// //                       child:Image.asset('assets/burger.png',
// //                        height: 70,
// //                        width:70,
// //                       fit: BoxFit.cover,),       
// //                       colorChange: burger,
// //                     ),
// //                   ),
                   
                  
// //                   GestureDetector(
// //                     onTap: (){
// //                        burger = false;
// //                       icecream= true;
// //                       salad = false; 
// //                       pizza = false; 
// //                       print('Hello');
                       
// //                       setState(() {
                        
// //                       });
// //                     },
// //                     child: NeuBox(child:Image.asset('assets/icecream.png',
// //                        height:70,
// //                        width:70,
// //                       fit: BoxFit.cover,),
// //                       colorChange: icecream,
// //                     ),
// //                   ),
                  
                
// //                   GestureDetector(
// //                     onTap: (){
// //                        burger = false;
// //                       icecream= false;
// //                       salad = false; 
// //                       pizza = true; 
// //                       print('Hello');
                       
// //                       setState(() {
                        
// //                       });
// //                     },
// //                     child: NeuBox(
// //                       child:Image.asset('assets/pizza.png',
// //                        height: 70,
// //                        width: 70,
// //                       fit: BoxFit.cover,),
// //                       colorChange: pizza,
// //                     ),
// //                   ),
                  
                  
// //                   GestureDetector(
// //                     onTap: () {
// //                       salad = true;
// //                       pizza = false; 
// //                       burger = false; 
// //                       icecream= false ;
// //                       setState(() {
                        
// //                       });
// //                     },
                  
// //                       child: NeuBox(
                       
// //                         child:Image.asset('assets/salad.png',
// //                          height:70,
// //                          width:70,
// //                         fit: BoxFit.cover,),
// //                         colorChange: salad,                 
// //                       )
// //                 ),
          
          
                
          
// //                 ]),
// //     );

// // }
// // }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app2/Data/data.dart';
// import 'package:ecommerce_app2/services/database.dart';
// import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
// import 'package:ecommerce_app2/widgets/food_menu.dart';
// import 'package:ecommerce_app2/widgets/neu.dart';
// import 'package:ecommerce_app2/widgets/user_selection_neu.dart';
// import 'package:flutter/material.dart';


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool icecream = false;
//   bool burger = false;
//   bool salad = false;
//   bool pizza = false;
//   Stream? foodItemStream; 

//   onTheLoad ()async{
//     foodItemStream = await DatabaseMethods().getFoodItem('Salad');
//     setState(() {
      
//     });
//   }

//   @override
//   void initState() {
//     onTheLoad();
//     // TODO: implement initState
//     super.initState();
//   }

//   Widget allItems (){
//     return StreamBuilder(stream: foodItemStream, builder: (context,AsyncSnapshot snapshot){
//      return snapshot.hasData?
    
     
//       ListView.builder(
//       padding: EdgeInsets.zero,
//       itemCount: snapshot.data.docs.length,
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemBuilder:(context,index){
//         DocumentSnapshot ds= snapshot.data.docs[index];
//         return GridView.builder(
//           shrinkWrap: true,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 10,
//           ),
//           scrollDirection: Axis.vertical,
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (context, index) {
//             final food = foods1[index];
//             return UserChoiceNeu(
//               title: ds['Name'],
//               subtitle: food['subtitle'].toString(),
//               price: '\$'+ds['Price'],
//               imagePath: ds['Image'],
//             );
//           },
//         );
//       })
//       :CircularProgressIndicator();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 14, top: 50,),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Hello Sarosh",
//                   style: BoldTextClass.DarkboldText(),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(right: 14),
//                   padding: const EdgeInsets.all(3),
//                   decoration: BoxDecoration(
//                     //color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Icon(
//                     Icons.shopping_cart_outlined,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Discover Food',
//               style: BoldTextClass.DarkboldTextLarge(),
//             ),
//             Text(
//               'Discover and Get Great Food',
//               style: BoldTextClass.LightboldText(),
//             ),
//             const SizedBox(height: 18),
//             categoriesRow(),
//             const SizedBox(height: 28),
//             SizedBox(
//               height: 250,
//               width: double.infinity,
//               child: allItems()
//             ),
//             const SizedBox(height: 30),
//             // Expanded(
//             //   child: ListView.builder(
//             //     scrollDirection: Axis.vertical,
//             //     itemCount: foods2.length,
//             //     itemBuilder: (context, index) {
//             //       final food2 = foods2[index];
//             //       return FoodMenu(
//             //         title: food2['title'].toString(),
//             //         subtitle: food2['subtitle'].toString(),
//             //         price: food2['price'].toString(),
//             //         imagePath: food2['imageUrl'].toString(),
//             //       );
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget categoriesRow() {
//     return Padding(
//       padding: const EdgeInsets.only(right: 18),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 burger = true;
//                 icecream = false;
//                 salad = false;
//                 pizza = false;
//               });
//             },
//             child: NeuBox(
//               child: Image.asset(
//                 'assets/burger.png',
//                 height: 70,
//                 width: 70,
//                 fit: BoxFit.cover,
//               ),
//               colorChange: burger,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 burger = false;
//                 icecream = true;
//                 salad = false;
//                 pizza = false;
//               });
//             },
//             child: NeuBox(
//               child: Image.asset(
//                 'assets/icecream.png',
//                 height: 70,
//                 width: 70,
//                 fit: BoxFit.cover,
//               ),
//               colorChange: icecream,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 burger = false;
//                 icecream = false;
//                 salad = false;
//                 pizza = true;
//               });
//             },
//             child: NeuBox(
//               child: Image.asset(
//                 'assets/pizza.png',
//                 height: 70,
//                 width: 70,
//                 fit: BoxFit.cover,
//               ),
//               colorChange: pizza,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 salad = true;
//                 pizza = false;
//                 burger = false;
//                 icecream = false;
//               });
//             },
//             child: NeuBox(
//               child: Image.asset(
//                 'assets/salad.png',
//                 height: 70,
//                 width: 70,
//                 fit: BoxFit.cover,
//               ),
//               colorChange: salad,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app2/Data/data.dart';
import 'package:ecommerce_app2/Pages/order_page.dart';
import 'package:ecommerce_app2/services/database.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:ecommerce_app2/widgets/food_menu.dart';
import 'package:ecommerce_app2/widgets/neu.dart';
import 'package:ecommerce_app2/widgets/user_selection_neu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool icecream = false;
  bool burger = false;
  bool salad = false;
  bool pizza = false;
  Stream? foodItemStream;

  onTheLoad() async {
    foodItemStream = await DatabaseMethods().getFoodItem('Burger'
    );
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85, // Adjust as per your design
          ),
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return UserChoiceNeu(
              title: ds['Name'],
              subtitle: ds['Details'],
              price: ds['Price'],
              imagePath: ds['ImageUrl'],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 12, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello There!",
                  style: BoldTextClass.DarkboldText(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          
                  Text(
                    'Discover Food',
                    style: BoldTextClass.DarkboldTextLarge(),
                  ),
                  Text(
                    'Discover and Get Great Food',
                    style: BoldTextClass.LightboldText(),
                  ),
                  const SizedBox(height: 10),
                          
                   Text(
                    'Categories',
                    style: BoldTextClass.DarkboldTextLarge(),
                  ),
                             const SizedBox(height: 13),
                  categoriesRow(),
                  const SizedBox(height: 14),
                  
                          
                   Text(
                    'Food items',
                    style: BoldTextClass.DarkboldTextLarge(),
                  ),
                  
                    const SizedBox(height: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right:8),
                      child: allItems()),
                  ),
                  
                
            
            
          //  const SizedBox(height: ),
            // Other widgets, if any
          ],
        ),
      ),
    );
  }

  Widget categoriesRow() {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ()async {
               foodItemStream = await DatabaseMethods().getFoodItem('Burger');
              setState(() {
                burger = true;
                icecream = false;
                salad = false;
                pizza = false;      
              });
            },
            child: NeuBox(
              child: Image.asset(
                'assets/burger.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              colorChange: burger,
            ),
          ),
          GestureDetector(
            onTap: () async{
              foodItemStream = await DatabaseMethods().getFoodItem('Ice-cream');
              setState(() {
                burger = false;
                icecream = true;
                salad = false;
                pizza = false;
              });
            },
            child: NeuBox(
              child: Image.asset(
                'assets/icecream.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              colorChange: icecream,
            ),
          ),
          GestureDetector(
            onTap: () async{
               foodItemStream = await DatabaseMethods().getFoodItem('Pizza');
              setState(() {
                burger = false;
                icecream = false;
                salad = false;
                pizza = true;
              });
            },
            child: NeuBox(
              child: Image.asset(
                'assets/pizza.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              colorChange: pizza,
            ),
          ),
          GestureDetector(
            onTap: () async{
               foodItemStream = await DatabaseMethods().getFoodItem('Salad');
              setState(() {
                salad = true;
                pizza = false;
                burger = false;
                icecream = false;
              });
            },
            child: NeuBox(
              child: Image.asset(
                'assets/salad.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              colorChange: salad,
            ),
          ),
        ],
      ),
    );
  }
}
