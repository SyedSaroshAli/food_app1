import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final bool colorChange;
  final Widget? child;
  const NeuBox({super.key,
  required this.child,
  required this.colorChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  colorChange? Color(0xFFD70F64) :Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 10,
            offset: const Offset(4, 4)
          ),
 
          //lighter shadow on top left
          BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            offset: const Offset(-4, -4)
          )
 
        ]
      ),
      child: child,
      padding: EdgeInsets.all(3),
    );
  }
}