import 'package:flutter/material.dart';
import 'package:wether_api/commons/theme_helper.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeHelper.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeHelper.black),
          ),
          labelStyle: TextHelper.medium14.copyWith(
            color: ThemeHelper.black,
          ),
        ),
      ),
    );
  }
}
