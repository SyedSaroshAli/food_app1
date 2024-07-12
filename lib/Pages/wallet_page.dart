import 'dart:convert';
import 'package:ecommerce_app2/widgets/add_money.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;


class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  bool container1 = false;
  bool container2 = false;
  bool container3 = false;
  bool container4 = false;
  Map<String,dynamic>? paymentIntentData ;

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
                        Text('\$100',
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
                         await makePayment();
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

  Future<void> makePayment()async{
     try{
       paymentIntentData = await createPaymentIntent('20', 'USD');
       await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          applePay: PaymentSheetApplePay(merchantCountryCode: 'US'),
         googlePay: PaymentSheetGooglePay(merchantCountryCode: "US",
         testEnv: true),
        style: ThemeMode.dark,
        merchantDisplayName: 'SAROSH'
        )
        );
     }catch(e){
      print(e.toString());
     }
  }

  displayPaymentSheet() async{
    try{
       await Stripe.instance.presentPaymentSheet();
       setState(() {
         paymentIntentData =   null;
       });

       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('success')));
    }catch(e){
      print(e.toString());
    }
  }

  createPaymentIntent(String amount,currency)async{
     try{
       Map<String,dynamic> body ={
         'amount': calculateAmount(amount),
         'currency':currency,
         'payment_method_types[]':'card' 
       };

       var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer sk_test_51PabDnG3GuIQ1Fn9GI81D21tECS7TeTdqFBn1P7Zq6wPGDLwXRrJ6h5BTdQt8TSb2OuoC6261ZVyi0HSMRmm4VG800fORbMXBT',
          'Content-Type':'application/x-www-form-urlencoded'
        }
       );
        
       return jsonDecode(response.body.toString()); 
     }catch(e){
      print(e.toString());
     }
  }

  calculateAmount(String amount){
    final price = int.parse(amount);
    return price.toString();
  }
}