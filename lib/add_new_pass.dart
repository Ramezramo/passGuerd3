import 'package:flutter/material.dart';
import 'ComplexXoperations/DataPageCrypto.dart';
import 'Reuseable_widgets/myCatButton.dart';
import 'Reuseable_widgets/myCatTextField.dart';
import 'DATABASECONTROLERS/MakeChangesInDataBase.dart';

TextEditingController _mailController = TextEditingController();
TextEditingController _passController = TextEditingController();
TextEditingController _accountName = TextEditingController();
TextEditingController _confirmpassController = TextEditingController();

MakeChangesDBM _ChangesDBM = MakeChangesDBM();

class AddNewPass extends StatefulWidget {
  bool mainPageOrStackTF;
  String? userId;
  String? websiteName;
  AddNewPass(
      {super.key,
      this.websiteName,
      this.userId,
      required this.mainPageOrStackTF});

  @override
  State<AddNewPass> createState() => _AddNewPassState();
}

class _AddNewPassState extends State<AddNewPass> {
  void _showPasswordMismatchSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Passwords do not match!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

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
                    padding: EdgeInsets.only(top: 20, bottom: 0),
                    child: Text("Add new pass",
                        style:
                            TextStyle(color: Color(0xFFA084DC), fontSize: 30)),
                  ),
                  if (widget.mainPageOrStackTF == true)
                    Container(
                        margin:
                            const EdgeInsets.only(top: 12, left: 20, right: 20),
                        child: MyTextField(
                          addDecaration: false,
                          hint_text: "account name",
                          is_password: false,
                          textEditingController: _accountName,
                        )),
                  Container(
                      margin:
                          const EdgeInsets.only(top: 12, left: 20, right: 20),
                      child: MyTextField(
                        addDecaration: false,
                        hint_text: "acoount email or phone",
                        is_password: false,
                        textEditingController: _mailController,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: MyTextField(
                            addDecaration: false,
                            hint_text: "account password",
                            is_password: false,
                            textEditingController: _passController,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Add your functionality here
                            String foundpass = generatePassword("sdfsdfasda",_mailController.text, "1");
                            setState(() {
                              _passController.text = foundpass;
                              _confirmpassController.text = foundpass;
                            });

                          },
                          icon: Icon(Icons.create),
                        ),
                      ],
                    ),
                  ),

                  Container(
                      margin:
                          const EdgeInsets.only(top: 12, left: 20, right: 20),
                      child: MyTextField(
                        addDecaration: false,
                        hint_text: "rewrite the password",
                        is_password: false,
                        textEditingController: _confirmpassController,
                      )),
                  MyButton(
                    onPressed: () {
                      if (_mailController.text.length > 1 &&
                          _passController.text.length > 1) {
                        if (_confirmpassController.text ==
                            _passController.text) {
                          if (widget.mainPageOrStackTF == true) {
                            _ChangesDBM.addNewPass(_accountName.text,
                                _passController.text, _mailController.text);
                          } else {
                            _ChangesDBM.addValueToaWebsite(
                                _passController.text,
                                _mailController.text,
                                widget.userId,
                                "besoes",
                                widget.websiteName);
                          }

                          _passController.clear();
                          _mailController.clear();
                          _confirmpassController.clear();
                          Navigator.of(context).pop();
                        } else {
                          _showPasswordMismatchSnackBar();
                        }
                      }
                    },
                    color: const Color(0xFFC4B0FF),
                    title: const Text("Add"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
