import 'package:flutter/material.dart';


void pushStack(context,pageRoute){
  Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoute,));

}