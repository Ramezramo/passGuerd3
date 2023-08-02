import 'package:flutter/material.dart';

import 'loding_now.dart';
// import 'package:firebase_cat/screens/loding_now.dart';

class MyButton extends StatelessWidget {

  MyButton({Key? key,this.color = Colors.red,required this.onPressed,this.title =  const Text("press me"),this.load_or_no = false,this.curveDegree = 10.0,this.textcolor = Colors.black54}) : super(key: key);
  final bool load_or_no;
  final Color color;
  final Text title;
  final double curveDegree ;
  final VoidCallback onPressed;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    Widget? buttonContains = load_or_no == false ? title : loading_Start();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(curveDegree),
        child: MaterialButton(
          textColor: textcolor,
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: buttonContains,
        ),
      ),
    );
  }
}
