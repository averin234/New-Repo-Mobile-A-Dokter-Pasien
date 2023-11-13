import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEntryField extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final int? maxLength;
  final bool? readonly;
  const MyEntryField(this.title,
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.maxLength,
      this.readonly,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            maxLength: maxLength,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            textInputAction: TextInputAction.next,
            readOnly: readonly?? false,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                suffixIcon: suffixIcon,
                fillColor: const Color(0xffecf8ff),
                filled: true),
          )
        ],
      ),
    );
  }
}
