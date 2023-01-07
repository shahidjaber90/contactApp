import 'package:contactapp/screens/add_contact.dart';
import 'package:contactapp/utils/Text.dart';
import 'package:contactapp/utils/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        title: Text(TextConstant.titleText,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorConstant.titleTextColor
        ),),
        actions: [
          Icon(Icons.search_outlined,color: ColorConstant.iconColor,),
          const SizedBox(width: 8,),
          Padding(
            padding:const EdgeInsets.only(right: 10),
         child: Icon(Icons.more_vert_outlined,color: ColorConstant.iconColor,),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AddContact()),
          );
      },
        backgroundColor: ColorConstant.floatButtonColor,
        child: Icon(Icons.add,color: ColorConstant.appBarColor,size: 30,),
        ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/Group.png'), 
          ),
          const SizedBox(height: 10,),
          Text(TextConstant.noContactsText,style: TextStyle(fontSize: 16,color: ColorConstant.titleTextColor),),
        ],
      ),
    );
  }
}