import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required String label,
  IconData? prefixIcon,
  String? hintText,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  FormFieldValidator<String>? validate,
  required TextInputType keyboard,
  bool isPassword = false,
  TextDirection? textDirection
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Material(
        child: TextFormField(
          textDirection: textDirection,
          style: TextStyle(color: AppColor.darkGrey),
          validator: validate,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.lightGrey,
            contentPadding: const EdgeInsetsDirectional.only(start: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.darkGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.darkGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: label,
            labelStyle: TextStyle(fontSize: 17,color: AppColor.darkGrey,),
            prefixStyle: TextStyle(color: AppColor.darkGrey ),
            // prefixIcon: Icon(prefixIcon,color: AppColor.darkGrey,),
            suffixIcon: IconButton(
              icon: Icon(suffixIcon,color: AppColor.darkGrey,),
              onPressed: suffixPressed,
            ),
            hintText: hintText,
            hintStyle: TextStyle( color:AppColor.darkGrey, ),
          ),
          keyboardType: keyboard,
          obscureText: isPassword,
        ),
      ),
    );