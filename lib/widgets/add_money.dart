import 'package:flutter/material.dart';

class AddMoney extends StatelessWidget {
  final String money;
  final bool selected ;
  const AddMoney({super.key,
  required this.money,
  required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
           padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
           decoration: BoxDecoration(
           color: selected?Color(0xFFD70F64):Color.fromARGB(255, 241, 215, 229),
           borderRadius: BorderRadius.circular(12)
          ),
           child: Text('\$$money',
           style: TextStyle(
           color:selected?Colors.white:Color(0xFFD70F64),
          fontSize: 18,
         ),),
        );
  }
}