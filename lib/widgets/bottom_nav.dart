import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app2/Pages/homepage.dart';
import 'package:ecommerce_app2/Pages/order_page.dart';
import 'package:ecommerce_app2/Pages/profile_page.dart';
import 'package:ecommerce_app2/Pages/wallet_page.dart';
import 'package:flutter/material.dart';


class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _ButtomNavigatorState();
}

class _ButtomNavigatorState extends State<BottomNavigator> {
  int currentIndex = 0; 
  late List pages = [];

  @override
  void initState() {
    // TODO: implement initState
    HomePage();
    WalletPage();
    OrderPage();
    ProfilePage();
    pages = [HomePage(), OrderPage(),WalletPage(),ProfilePage()];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.transparent,
        color: Color(0xFFD70F64),
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentIndex = index ; 
          });
        },
        items:[
          Icon(Icons.home_outlined,
          color: Colors.white,),
          Icon(Icons.shopping_bag_outlined,
          color: Colors.white),
          Icon(Icons.wallet_outlined,
          color: Colors.white),
          Icon(Icons.person_outlined,
          color: Colors.white),
        ] ),

        body : pages[currentIndex]
    );
  }
}