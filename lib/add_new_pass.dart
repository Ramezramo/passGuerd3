
import 'package:flutter/material.dart';
import 'Reuseable_widgets/myCatButton.dart';
import 'Reuseable_widgets/myCatTextField.dart';
import 'DATABASECONTROLERS/MakeChangesInDataBase.dart';


TextEditingController _mailController = TextEditingController();
TextEditingController _passController = TextEditingController();
TextEditingController _accountName = TextEditingController();

MakeChangesDBM _ChangesDBM =MakeChangesDBM();
class AddNewPass extends StatefulWidget {
  bool mainPageOrStackTF;
  String? userId;
  String? websiteName;
   AddNewPass({super.key,this.websiteName,this.userId ,required this.mainPageOrStackTF});

  @override
  State<AddNewPass> createState() => _AddNewPassState();
}

class _AddNewPassState extends State<AddNewPass> {


  @override
  Widget build(BuildContext context) {
    _ChangesDBM.getCurrentUser();
    // settingUserId();
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(

          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 300),
              child: Column(

                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 0),
                    child: Text("Add new pass",style: TextStyle(color: Color(0xFFA084DC),fontSize: 30)),
                  ),
                  if(widget.mainPageOrStackTF == true)Container(margin: const EdgeInsets.only(top: 12,left: 20,right: 20),child: MyTextField(addDecaration: false,hint_text: "account name", is_password: false,textEditingController: _accountName,)),
                  Container(margin: const EdgeInsets.only(top: 12,left: 20,right: 20),child: MyTextField(addDecaration: false,hint_text: "acoount email or phone", is_password: false,textEditingController: _mailController,)),
                  Container(margin: const EdgeInsets.only(top: 12,left: 20,right: 20),child: MyTextField(addDecaration: false,hint_text: "account password", is_password: true,textEditingController: _passController,)),

                  MyButton(onPressed: (){
                    if (_mailController.text.length > 1 && _passController.text.length > 1){
                      // setState(() {
                        // print(_mailController.text);
                        // print(_passController.text);
                      // });
                      if(widget.mainPageOrStackTF == true){
                        _ChangesDBM.addNewPass(_accountName.text,_passController.text,_mailController.text);
                      }else{
                        _ChangesDBM.addValueToaWebsite(_passController.text, _mailController.text, widget.userId, "besoes", widget.websiteName);
                      }

                      _passController.clear();
                      _mailController.clear();
                      Navigator.of(context).pop();
                    }


                  },color: const Color(0xFFC4B0FF),title: const Text("Add"),),
                ],
              ),
            ),
          ],

        ),
      ),);
  }
}

