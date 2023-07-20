import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluitcare/app/data/componen/data_regist_model.dart';
import 'package:pluitcare/app/data/componen/fetch_data.dart';
import 'package:pluitcare/app/data/componen/local_storage.dart';
import 'package:pluitcare/app/data/model/login_and_regist/akses_px.dart';
import 'package:pluitcare/app/modules/login/controllers/login_controller.dart';
import '../../../../routes/app_pages.dart';
import '../constants.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';
import 'fade_slide_transition.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
        child: Column(
          children: [
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 0.0,
              child: CustomInputField(
                controller: controller.usernameController,
                label: 'Username or Email',
                prefixIcon: Icons.person,
              ),
            ),
            SizedBox(height: space),
            Obx(() {
              return FadeSlideTransition(
                animation: animation,
                additionalOffset: space,
                child: CustomInputField(
                  controller: controller.passwordController,
                  label: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: controller.isObscurePass.value,
                  suffixIcon: controller.isObscurePass.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onTapSuffix: () => controller.isObscurePass.isFalse
                      ? controller.isObscurePass.value = true
                      : controller.isObscurePass.value = false,
                ),
              );
            }),
            SizedBox(height: space),
            Obx(() {
              return FadeSlideTransition(
                animation: animation,
                additionalOffset: 2 * space,
                child: ListTile(
                  dense: true,
                  onTap: () => controller.ingatSaya.value == false
                      ? controller.ingatSaya.value = true
                      : controller.ingatSaya.value = false,
                  leading: Checkbox(
                    splashRadius: 0,
                    value: controller.ingatSaya.value,
                    onChanged: (value) => controller.ingatSaya.value = value!,
                  ),
                  title: Text(
                    "Ingat Saya",
                    style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * space,
              child: CustomButton(
                color: kBlue,
                textColor: kWhite,
                text: 'Login Sekarang',
                onPressed: () async {
                  if (controller.passwordController.text.isNotEmpty &&
                      controller.passwordController.text.isNotEmpty) {
                    Get.defaultDialog(
                      content: const CircularProgressIndicator(),
                      title: 'Loading..',
                      barrierDismissible: false,
                    );
                    await LocalStorages.setDataRegist(
                        DataRegist(ingatSaya: controller.ingatSaya.value));
                    AksesPX aksesPX = await API.getAksesPx(
                      pass: controller.passwordController.text,
                      user: controller.usernameController.text,
                    );

                    if (aksesPX.code != 200) {
                      Get.snackbar(
                          aksesPX.code.toString(), aksesPX.msg.toString());
                    } else {
                      Get.offAllNamed(Routes.HOME);
                    }
                  } else {
                    Get.snackbar('404', 'Username dan Password harus di Isi');
                  }
                },
              ),
            ),
            SizedBox(height: 2 * space),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 4 * space,
              child: CustomButton(
                color: kBlack,
                textColor: kWhite,
                text: 'Registrasi Akun',
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
              ),
            ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
