import 'package:contactapp/utils/color.dart';
import 'package:flutter/material.dart';



textFieldFunction(label, hintText,control) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.titleTextColor),
            ),
          ],
        ),
        const SizedBox(height: 5,),
        TextField(
          controller: control,
          decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: ColorConstant.fieldColor,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(1))),
        ),
        const SizedBox(height: 14,),
      ],
    ),
  );
}