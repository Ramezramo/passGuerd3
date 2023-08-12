import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:password_saver/Reuseable_widgets/myCatButton.dart';
import 'package:password_saver/Reuseable_widgets/myCatTextField.dart';

import 'Constants.dart';

class findCreatorPage extends StatefulWidget {
  const findCreatorPage({Key? key}) : super(key: key);

  @override
  State<findCreatorPage> createState() => _findCreatorPageState();
}

class _findCreatorPageState extends State<findCreatorPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //     child: appDrawer()
      // ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("find my pass"),
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0,left: 30,bottom: 15,right: 30),
            child: MyTextField(textEditingController: textEditingController,addDecaration: true, is_password: false,text_input_type: TextInputType.emailAddress,borderSide_color:K_card_listTile_color,borderSide_color_infocas:K_card_bg ,hint_text: "type your email or phone", ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,bottom: 15,right: 30),
            child: MyTextField(textEditingController: textEditingController,addDecaration: true, is_password: false,text_input_type: TextInputType.emailAddress,borderSide_color:K_card_listTile_color,borderSide_color_infocas:K_card_bg ,hint_text: "type your key", ),
          ),
          MyButton(onPressed: (){

          },color: k_butom_color,title: Text("find"),minWidth: 100),

          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: K_card_listTile_color,
                    child: ListTile(
                      leading: Icon(MdiIcons.lock),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text("tesst"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(
                          text: "tesst"));
                    },
                    icon: const Icon(Icons.copy))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
