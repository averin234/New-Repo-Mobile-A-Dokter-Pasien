import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/modules/register/controllers/register_controller.dart';

class MyPassWord extends GetView<RegisterController> {
  const MyPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'BUAT PASSWORD',
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            MyTextField(
              'Password',
              controller: controller.passwordController.value,
              obscureText: controller.isObscurePass,
            ),
            MyTextField(
              'Confirm Password',
              controller: controller.confirmPassController.value,
              obscureText: controller.isObscureConfirmPass,
            ),
          ],
        ));
  }
}

class MyTextField extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final RxBool obscureText;
  final TextEditingController controller;
  final int? maxLength;
  const MyTextField(
    this.title, {
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    required this.obscureText,
  });

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
          Obx(() {
            return TextField(
              maxLength: maxLength,
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText.value,
              textInputAction: TextInputAction.next,
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
                  suffixIcon: IconButton(
                      onPressed: () {
                        obscureText.value == false
                            ? obscureText.value = true
                            : obscureText.value = false;
                      },
                      icon: Icon(obscureText.value == false
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  fillColor: const Color(0xffecf8ff),
                  filled: true),
            );
          })
        ],
      ),
    );
  }
}
