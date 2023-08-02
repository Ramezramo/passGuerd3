

import 'loding_now.dart';

import 'package:flutter/material.dart';


InputDecoration my_TextField_decoration (lineWidth,borderradios,hinttextcolor,hint_text,raidos_circuler,borderSide_color,borderSide_color_infocus,add_decoration_or_no) {
  // Color borderSide_color_infocus;
  // Color borderSide_color;
  double _raidos_circuler = raidos_circuler == "default" ? 32 : raidos_circuler  ;
  return InputDecoration(
    hintText: hint_text,
    // labelStyle: TextStyle(color:Colors.black ),
    // fillColor: Colors.black,


    hintStyle: TextStyle(color: hinttextcolor),

    suffixIcon: null,


    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: add_decoration_or_no ? OutlineInputBorder(
      borderRadius: borderradios,
    ): null,
    enabledBorder: add_decoration_or_no ? OutlineInputBorder(
      borderSide: BorderSide(color: borderSide_color, width: lineWidth),
      borderRadius: borderradios,
    ) : null,
    focusedBorder: add_decoration_or_no ? OutlineInputBorder(
      borderSide: BorderSide(color: borderSide_color_infocus, width: lineWidth),
      borderRadius: borderradios,
    ): null,
  );
}
