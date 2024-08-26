import 'dart:convert';
import 'package:ecommerce_app2/services/database.dart';
import 'package:ecommerce_app2/services/shared_pref.dart';
import 'package:ecommerce_app2/widgets/add_money.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String? id,wallet;
  int add = 0;
  bool container1 = false;
  bool container2 = false;
  bool container3 = false;
  bool container4 = false;
  Map<String,dynamic>? paymentIntentData ;
  
  Future<void> getTheSharedPref()async{
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet();
    if (wallet==null){
      wallet = '0';
    }
    setState(() {
      
    });
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }
  
onTheLoad ()async{
     await getTheSharedPref();
     setState(() {
       
     });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(top:40),
              color: Colors.white,
              width: double.infinity,
              height: 90,
              
              child: Column(children: [
              Center(child: Text('Wallet',
              style: BoldTextClass.DarkboldTextLarge(),)),
          
              ],
              ),
            ),
          ),

           const SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                width: double.infinity,
                color: Color(0xFFF2F2F2),
                child: Row(
                  children: [
                     Image.asset('assets/wallet.png',
                     height: 60,
                     width: 60,
                     fit: BoxFit.cover),
                    
                     const SizedBox(width: 10,),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Wallet',
                        style: BoldTextClass.LightboldText(),),
                        Text('\$${wallet??0}',
                        style: BoldTextClass.DarkboldText(),)
                      ],
                     )
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add Money',
                    style: BoldTextClass.DarkboldText(),),

                    const SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                            container1=true;
                            container2=false;
                            container3=false;
                            container4=false;
                            });
                          },
                          child: AddMoney(
                            money: '100', 
                            selected: container1)
                        ),
                        
                        GestureDetector(
                          onTap: (){
                            setState(() {
                            container1=false;
                            container2=true;
                            container3=false;
                            container4=false;
                            });
                           },
                          child: AddMoney(
                            money: '500',
                            selected: container2)
                        ),
                        
                       GestureDetector(
                        onTap: (){
                          setState(() {
                            container1=false;
                            container2=false;
                            container3=true;
                            container4=false;
                            });
                        },
                        child: AddMoney(
                        money: '1000', 
                        selected: container3),
                       ),
                        
                        GestureDetector(
                          onTap: (){
                            setState(() {
                            container1=false;
                            container2=false;
                            container3=false;
                            container4=true;
                            });
                          },
                          child: AddMoney(
                            money: '2000', 
                            selected: container4),
                        )
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height/15),
                    GestureDetector(
                      onTap: ()async{
                         await makePayment(container1, container2, container3, container4,);
                         print('heelo');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFD70F64),
                        ),
                        child: Center(
                          child: Text('Add Money',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
        ],
      )
    );
  }

  // Your existing code with some improvements

Future<void> makePayment(bool container1,bool container2,bool container3,bool container4)async {
  try {
    paymentIntentData = await createPaymentIntent(container1? 100:container2? 500:container3? 1000 :container4? 2000: 0 , 
    'USD');
     // Adjust amount and currency
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        googlePay: PaymentSheetGooglePay(
          merchantCountryCode: 'US',
          testEnv: true,
        ),
        style: ThemeMode.dark,
        merchantDisplayName: 'SAROSH',
      ),
    );

    displayPaymentSheet();
  } catch (e) {
    print('Error initializing payment: $e');
    // Handle error scenarios
  }
}

void displayPaymentSheet() async {
  try {
    add= container1? 100: container2? 500: container3? 1000: container4? 2000:0;
    add= int.parse(wallet!)+add;

    await Stripe.instance.presentPaymentSheet();
    await SharedPreferenceHelper().saveUserWallet(add.toString());
    await DatabaseMethods().UpdateWallet(id!,add.toString());
    setState(() {
      paymentIntentData = null;
      
    });
    showDialog(context: context, 
    builder: (_)=>AlertDialog(
      content: Container(
        height: 30,
        width: 150,
        child: Row(
          children: [
            Icon(Icons.check_circle,color: Colors.green,),

            Text('   Payment Successful',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    ),
    
    );
    await getTheSharedPref();
    // await saveWalletAmount();
    Future.delayed(Duration(seconds: 2), () {
    Navigator.of(context).pop(); // Dismiss AlertDialog
  });
    
    
  } catch (e) {
    print('Error presenting payment sheet: $e');
    // Handle error scenarios
  }
}

Future<Map<String, dynamic>> createPaymentIntent(int amount, String currency) async {
  try {
    if(amount==0){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Select Amount')));
    }
    Map<String, dynamic> body = {
      'amount': calculateAmount(amount),
      'currency': currency,
      'payment_method_types[]': 'card',
    };

    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      body: body,
      headers: {
        'Authorization': 'Bearer sk_test_51PabDnG3GuIQ1Fn9GI81D21tECS7TeTdqFBn1P7Zq6wPGDLwXRrJ6h5BTdQt8TSb2OuoC6261ZVyi0HSMRmm4VG800fORbMXBT',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body.toString());
    } else {
      throw Exception('Failed to load payment intent');
    }
  } catch (e) {
    print('Error creating payment intent: $e');
    throw e;
  }
}

String calculateAmount(int amount) {
  final price = amount*100;
  return price.toString();
}

// loadWalletAmount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       walletMoney = prefs.getInt('walletMoney')??0;
//     });
//   }

// saveWalletAmount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('walletMoney', walletMoney);
//   }

}
//   Future<void> makePayment()async{
//      try{
//        paymentIntentData = await createPaymentIntent('20000', 'USD');
//        await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntentData!['client_secret'],
//           //applePay: PaymentSheetApplePay(merchantCountryCode: 'US',),
//          googlePay: PaymentSheetGooglePay(merchantCountryCode: "US",
//          testEnv: true),
//         style: ThemeMode.dark,
//         merchantDisplayName: 'SAROSH'
//         )
//         );
//      }catch(e){
//       print(e.toString());
//      }
//   }

//   displayPaymentSheet() async{
//     try{
//        await Stripe.instance.presentPaymentSheet();
//        setState(() {
//          paymentIntentData = null;
//        });

//        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('success')));
//     }catch(e){
//       print(e.toString());
//     }
//   }

//   createPaymentIntent(String amount,currency)async{
//      try{
//        Map<String,dynamic> body ={
//          'amount': calculateAmount(amount),
//          'currency':currency,
//          'payment_method_types[]':'card' 
//        };

//        var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         body: body,
//         headers: {
//           'Authorization': 'Bearer sk_test_51PabDnG3GuIQ1Fn9GI81D21tECS7TeTdqFBn1P7Zq6wPGDLwXRrJ6h5BTdQt8TSb2OuoC6261ZVyi0HSMRmm4VG800fORbMXBT',
//           'Content-Type':'application/x-www-form-urlencoded'
//         }
//        );
        
//        return jsonDecode(response.body.toString()); 
//      }catch(e){
//       print(e.toString());
//      }
//   }

//   calculateAmount(String amount){
//     final price = int.parse(amount);
//     return price.toString();
//   }
// }


// import 'dart:convert';
// import 'package:ecommerce_app2/services/database.dart';
// import 'package:ecommerce_app2/services/shared_pref.dart';
// import 'package:ecommerce_app2/widgets/add_money.dart';
// import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class WalletPage extends StatefulWidget {
//   const WalletPage({super.key});

//   @override
//   State<WalletPage> createState() => _WalletPageState();
// }

// class _WalletPageState extends State<WalletPage> {
//   String? wallet, id;
//   int add = 0;
//   bool container1 = false;
//   bool container2 = false;
//   bool container3 = false;
//   bool container4 = false;
//   Map<String, dynamic>? paymentIntentData;

//   @override
//   void initState() {
//     super.initState();
//     onTheLoad();
//   }

//   Future<void> getTheSharedPref() async {
//     id = await SharedPreferenceHelper().getUserId();
//     wallet = await SharedPreferenceHelper().getUserWallet();
//     setState(() {});
//   }

//   Future<void> onTheLoad() async {
//     await getTheSharedPref();
//     if (id != null) {
//       wallet = await DatabaseMethods().getUserWallet(id!);
//       await SharedPreferenceHelper().saveUserWallet(wallet!);
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Material(
//             elevation: 5,
//             child: Container(
//               padding: EdgeInsets.only(top: 40),
//               color: Colors.white,
//               width: double.infinity,
//               height: 90,
//               child: Column(
//                 children: [
//                   Center(
//                     child: Text(
//                       'Wallet',
//                       style: BoldTextClass.DarkboldTextLarge(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             width: double.infinity,
//             color: Color(0xFFF2F2F2),
//             child: Row(
//               children: [
//                 Image.asset(
//                   'assets/wallet.png',
//                   height: 60,
//                   width: 60,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Your Wallet',
//                       style: BoldTextClass.LightboldText(),
//                     ),
//                     Text(
//                       '\$${wallet.toString()}',
//                       style: BoldTextClass.DarkboldText(),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Add Money',
//                   style: BoldTextClass.DarkboldText(),
//                 ),
//                 const SizedBox(height: 25),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           container1 = true;
//                           container2 = false;
//                           container3 = false;
//                           container4 = false;
//                         });
//                       },
//                       child: AddMoney(money: '100', selected: container1),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           container1 = false;
//                           container2 = true;
//                           container3 = false;
//                           container4 = false;
//                         });
//                       },
//                       child: AddMoney(money: '500', selected: container2),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           container1 = false;
//                           container2 = false;
//                           container3 = true;
//                           container4 = false;
//                         });
//                       },
//                       child: AddMoney(money: '1000', selected: container3),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           container1 = false;
//                           container2 = false;
//                           container3 = false;
//                           container4 = true;
//                         });
//                       },
//                       child: AddMoney(money: '2000', selected: container4),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height / 15),
//                 GestureDetector(
//                   onTap: () async {
//                     await makePayment(container1, container2, container3, container4);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Color(0xFFD70F64),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Add Money',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> makePayment(bool container1, bool container2, bool container3, bool container4) async {
//     try {
//       paymentIntentData = await createPaymentIntent(
//         container1 ? 100 : container2 ? 500 : container3 ? 1000 : container4 ? 2000 : 0,
//         'USD',
//       );
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntentData!['client_secret'],
//           googlePay: PaymentSheetGooglePay(
//             merchantCountryCode: 'US',
//             testEnv: true,
//           ),
//           style: ThemeMode.dark,
//           merchantDisplayName: 'SAROSH',
//         ),
//       );

//       displayPaymentSheet();
//     } catch (e) {
//       print('Error initializing payment: $e');
//       // Handle error scenarios
//     }
//   }

//   void displayPaymentSheet() async {
//     try {
//       add = container1 ? 100 : container2 ? 500 : container3 ? 1000 : container4 ? 2000 : 0;
//       add = int.parse(wallet!) + add;

//       await Stripe.instance.presentPaymentSheet();
//       await SharedPreferenceHelper().saveUserWallet(add.toString());
//       await DatabaseMethods().UpdateWallet(id!, add.toString());
//       setState(() {
//         paymentIntentData = null;
//       });
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           content: Container(
//             height: 30,
//             width: 150,
//             child: Row(
//               children: [
//                 Icon(Icons.check_circle, color: Colors.green),
//                 Text(
//                   '   Payment Successful',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//       await getTheSharedPref();
//       Future.delayed(Duration(seconds: 2), () {
//         Navigator.of(context).pop(); // Dismiss AlertDialog
//       });
//     } catch (e) {
//       print('Error presenting payment sheet: $e');
//       // Handle error scenarios
//     }
//   }

//   Future<Map<String, dynamic>> createPaymentIntent(int amount, String currency) async {
//     try {
//       if (amount == 0) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Select Amount')));
//         throw Exception('No amount selected');
//       }

//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card',
//       };

//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         body: body,
//         headers: {
//           'Authorization': 'Bearer sk_test_51PabDnG3GuIQ1Fn9GI81D21tECS7TeTdqFBn1P7Zq6wPGDLwXRrJ6h5BTdQt8TSb2OuoC6261ZVyi0HSMRmm4VG800fORbMXBT',
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body.toString());
//       } else {
//         throw Exception('Failed to load payment intent');
//       }
//     } catch (e) {
//       print('Error creating payment intent: $e');
//       throw e;
//     }
//   }

//   String calculateAmount(int amount) {
//     final price = amount * 100;
//     return price.toString();
//   }
// }

