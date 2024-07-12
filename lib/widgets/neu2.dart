import 'package:flutter/material.dart';

class NeuBox2 extends StatelessWidget {
  final Widget? child;
  const NeuBox2({super.key,
  required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 8,
            offset: const Offset(4, 4)
          ),
 
          //lighter shadow on top left
          BoxShadow(
            color: Colors.white,
            blurRadius: 8,
            offset: const Offset(-4, -4)
          )
 
        ]
      ),
      child: child,
      padding: EdgeInsets.all(3),
    );
  }
}