// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app2/services/database.dart';
// import 'package:ecommerce_app2/services/shared_pref.dart';
// import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
// import 'package:flutter/material.dart';

// class OrderPage extends StatefulWidget {
//   const OrderPage({super.key});

//   @override
//   State<OrderPage> createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
//   String? id,wallet;
//   Stream? foodItemStream;
//    var total = 0.0;
//    var amount2 = 0;

//   void setTimer(){
//     Timer(Duration(seconds: 1), (){
//       amount2=total.toInt();
//       setState(() {
        
//       });
//     });
//   }

//   getthesharedpref()async{
//     id= await SharedPreferenceHelper().getUserId();
//     wallet = await SharedPreferenceHelper().getUserWallet();
//     setState(() {
      
//     });
//   } 
  
//   onTheLoad()async{
//     await getthesharedpref();
//     foodItemStream = await DatabaseMethods().getFoodCart(id!);
//     setState(() {
      
//     });
// }

// @override
//   void initState() {
//     onTheLoad();
//     setTimer();
//     // TODO: implement initState
//     super.initState();
//   }

//    Widget foodCart() {
//     return StreamBuilder(
//       stream: foodItemStream,
//       builder: (context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator());
//         }
//         total = 0 ;
//         return ListView.builder(
//           padding: EdgeInsets.zero,
//           itemCount: snapshot.data.docs.length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
        
//             DocumentSnapshot ds = snapshot.data.docs[index];
//             total = total + double.parse(ds['Total']);
//             return  Padding(
//               padding: const EdgeInsets.only(bottom: 10,left: 3,right: 3),
//               child: Material(
//                         elevation: 3,
//                         borderRadius: BorderRadius.circular(10),
//                         child: Container(
                        
//                           padding: EdgeInsets.all(10),
//                           child: Row(
                            
//                             children: [
//                               Container(
//                                 height: 90,
//                                 width: 40,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(),
//                                   borderRadius: BorderRadius.circular(10)
//                                 ),
//                                 child: Center(child: Text(ds['Quantity'])),
//                               ),
                          
//                               SizedBox(width: MediaQuery.of(context).size.width/22,),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(60),
//                                 child: Image.network(ds['Image'],
//                                 height: 80,
//                                 width: 80,
//                                 fit: BoxFit.cover,),
//                               ),
                         
//                               SizedBox(width: MediaQuery.of(context).size.width/35,), 
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(ds['Name'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Poppins',
//                                   color: Colors.black
//                                   ),),
                                   
//                                   Text('\$'+ds['Total'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Poppins',
//                                    color: Colors.black
//                                   ),),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//             );
//           },
//         );
//       },
//     );
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  SingleChildScrollView(
//         child: Column(
//           children: [
//             Material(
//                   elevation: 5,
//                   child: Container(
//                     padding: EdgeInsets.only(top:40),
//                     color: Colors.white,
//                     width: double.infinity,
//                     height: 90,
                    
//                     child: Column(children: [
//                     Center(child: Text('Food Cart',
//                     style: BoldTextClass.DarkboldTextLarge(),)),
                
//                     ],
//                     ),
//                   ),
//                 ),
        
//                Padding(
//                  padding: EdgeInsets.only(
//                   left:MediaQuery.of(context).size.width/18,
//                   right: MediaQuery.of(context).size.width/18,
//                   top:8
//                   ),
//                  child: Column(
//                   children: [
                   

                    
                         
//                     SizedBox(height: MediaQuery.of(context).size.height/150,),
//                     Container(
//                       height: MediaQuery.of(context).size.height/1.6,
//                       child: foodCart()),
                     
//                     SizedBox(height: MediaQuery.of(context).size.height/60,),
                    
//                      Divider(
//                       height: 2,
//                      ),
//                    SizedBox(height: 5,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Total Price',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.black54,
//                           fontFamily: 'Poppins'
//                         ),),
//                         Text('\$'+total.toString(),
//                         style: BoldTextClass.DarkboldText(),)
//                       ],
//                     ),
                    
//                     SizedBox(height: MediaQuery.of(context).size.height/40,),
//                     GestureDetector(
//                       onTap: ()async{
//                         if(wallet!='0'){
//                          var amount = int.parse(wallet!)-total;
//                          await DatabaseMethods().UpdateWallet(id!, amount.toString());
//                          await SharedPreferenceHelper().saveUserWallet(amount.toString());
//                         }

//                         else{
//                           showDialog(
//                             context: context, 
//                             builder: (context){
//                              return AlertDialog(
//                               backgroundColor: Colors.white,
//                               title: Text('Empty Wallet'),
//                               content: Text('Add Money to Your wallet',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16
//                               ),),

//                               actions: [
//                                 TextButton(
//                                   onPressed: (){
//                                     Navigator.pop(context);
//                                   }, 
//                                   child: Text('OK',
//                                   style: TextStyle(
//                                     color: Color(0xFFD70F64)
//                                   ),))
//                               ],
//                              );
//                             });
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Color(0xFFD70F64)
//                         ),
//                         child: Center(
//                           child: Text('CheckOut',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20
//                           ),),
//                         ),
//                       ),
//                     )
//                   ],
//                  ),
//                ) 
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app2/services/database.dart';
import 'package:ecommerce_app2/services/shared_pref.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String? id, wallet;
  Stream? foodItemStream;
  double total = 0.0;
  double amount2 = 0;

  void setTimer() {
    Timer(Duration(seconds: 1), () {
      amount2 = total;
      setState(() {});
    });
  }

  Future<void> getSharedPref() async {
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet() ?? '0'; // Ensure wallet is initialized to '0' if null
    setState(() {});
  }

  Future<void> onTheLoad() async {
    await getSharedPref();
    foodItemStream = await DatabaseMethods().getFoodCart(id!);
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    setTimer();
    super.initState();
  }

  Widget foodCart() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        total = 0.0; // Reset total for recalculation
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            total += double.parse(ds['Total']);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 3, right: 3),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(ds['Quantity'])),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 22),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          ds['Image'],
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 35),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ds['Name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\$' + ds['Total'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                color: Colors.white,
                width: double.infinity,
                height: 90,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Food Cart',
                        style: BoldTextClass.DarkboldTextLarge(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 18,
                right: MediaQuery.of(context).size.width / 18,
                top: 8,
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 150),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: foodCart(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  Divider(height: 2),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        '\$' + total.toString(),
                        style: BoldTextClass.DarkboldText(),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  GestureDetector(
                    onTap: () async {
                      if (wallet != '0') {
                        int amount = int.parse(wallet!) - total.toInt();
                        await DatabaseMethods().UpdateWallet(id!, amount.toString());
                        
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text('Order Successful'),
                              content: Text(
                                '\$$total has been deducted from your wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Color(0xFFD70F64)),
                                  ),
                                ),
                              ],
                            );
                          },
                        );

                          final cartSnapshot = await FirebaseFirestore.instance
                          .collection('users')
                          .doc(id)
                          .collection('Cart')
                          .get();

                      for (var doc in cartSnapshot.docs) {
                        await DatabaseMethods().removeFoodFromCart(id!, doc.id);
                      }
                     
                      
                        await SharedPreferenceHelper().saveUserWallet(amount.toString());
                        setState(() {
                          
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text('Empty Wallet'),
                              content: Text(
                                'Add Money to Your wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Color(0xFFD70F64)),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFD70F64),
                      ),
                      child: Center(
                        child: Text(
                          'CheckOut',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
