import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/info_pluitcare_controller.dart';

class InfoadokterView extends GetView<InfoadokterController> {
  const InfoadokterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Pluit care'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'InfoadokterView is working',
          style: GoogleFonts.nunito(fontSize: 20),
        ),
      ),
    );
  }
}
