import 'package:flutter/material.dart';
import 'package:pluitcare/app/modules/info_pluitcare/controllers/info_pluitcare_controller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfopluitcareView extends GetView<InfopluitcareController> {
  const InfopluitcareView({Key? key}) : super(key: key);
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
          'InfopluitcareView is working',
          style: GoogleFonts.nunito(fontSize: 20),
        ),
      ),
    );
  }
}
