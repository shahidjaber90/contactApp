import 'package:contactapp/screens/listView_widget.dart';
import 'package:contactapp/utils/Text.dart';
import 'package:contactapp/utils/color.dart';
import 'package:contactapp/widgets/list_widget.dart';
import 'package:contactapp/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact({super.key});

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController phone = TextEditingController();

  editContact(context, index) {
    setState(() {
      Navigator.pop(context);
      contacts[index] = {
        "name": name.text,
        "surName": surName.text,
        "phone": phone.text,
      };
      name.clear();
      surName.clear();
      phone.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstant.iconColor,
            )),
        title: Text(
          TextConstant.addText,
          style: TextStyle(color: ColorConstant.titleTextColor),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                  onPressed: () {
                    // name.text = contacts[index]['name'];
                    // surName.text = contacts[index]['surName'];
                    // phone.text = contacts[index]['phone'];
                    editContact(context, contacts);
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ListViewPage()),
                    // );
                  },
                  icon: Icon(
                    Icons.check,
                    color: ColorConstant.iconColor,
                  ))),
        ],
      ),
      body: Column(
        children: [
          textFieldFunction(
              TextConstant.nameText, TextConstant.enterNameText, name),
          textFieldFunction(
              TextConstant.surNameText, TextConstant.enterSurNameText, surName),
          textFieldFunction(
              TextConstant.phoneText, TextConstant.enterPhoneText, phone),
        ],
      ),
    );
  }
}
