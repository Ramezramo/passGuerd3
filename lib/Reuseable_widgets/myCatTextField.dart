
import 'OwnTextFieldDecoration.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool addDecaration;
  TextEditingController? textEditingController = TextEditingController();
  // late TextEditingController? textEditingController;
  final String? hint_text;
  final TextInputType text_input_type;
  final bool is_password;
  final double? decoration_degree;
  final Color borderSide_color;
  final Color borderSide_color_infocas;
  final bool enabled;
  final Color hintTextColor;

  final borderradios;
  final Color? backGroundColor;
  final double? lineWidth;
  final Icon? prefixIcon;



  MyTextField({Key? key,this.prefixIcon = null ,this.lineWidth = 1.0,this.backGroundColor = null,this.borderradios = null,this.hintTextColor = Colors.black54,this.enabled = true,required this.addDecaration,this.textEditingController = null, this.hint_text = null , this.text_input_type = TextInputType.emailAddress, required this.is_password, this.decoration_degree = 12,this.borderSide_color = Colors.red,this.borderSide_color_infocas = Colors.green}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nradios = borderradios == null ?   BorderRadius.all(Radius.circular(10)):borderradios;
    return Container(

      color: backGroundColor,
      child: TextField(

        controller: textEditingController,
        keyboardType: text_input_type,
        obscureText: is_password,
        enabled: enabled,
        cursorColor: Colors.red,

        decoration:

        my_TextField_decoration(prefixIcon,lineWidth,nradios,hintTextColor,
            hint_text, decoration_degree, borderSide_color, borderSide_color_infocas,addDecaration),
      ),
    );
  }
}


