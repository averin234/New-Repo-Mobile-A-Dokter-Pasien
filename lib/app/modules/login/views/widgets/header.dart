import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/routes/app_pages.dart';

import '../constants.dart';
import 'fade_slide_transition.dart';

class Headerlogin extends StatelessWidget {
  final Animation<double> animation;

  const Headerlogin({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.NO_HOME),
                  child: Text(
                    "Lewati Login",
                    style: GoogleFonts.nunito(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/info.png',
                height: 60,
                width: 100,
              ),
              const SizedBox(height: kSpaceM),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 0.0,
                child: Text(
                  'A-Dokter',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: kSpaceS),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 16.0,
                child: Text(
                  'Aplikasi dokter berbasis cloud untuk meningkatkan kualitas pelayanan praktek dokter mandiri.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kBlack.withOpacity(0.5),
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
