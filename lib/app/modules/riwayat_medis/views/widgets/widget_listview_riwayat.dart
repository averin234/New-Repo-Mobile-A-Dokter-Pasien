import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/model/mr_pasien/listMRPX.dart';
import '../../../../routes/app_pages.dart';

class CardListViewRiawayat extends StatelessWidget {
  final Res res;
  const CardListViewRiawayat({
    super.key,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFe0e0e0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(2, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.only(top: 10),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_RIWAYAT, arguments: res.idReg!);
                },
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 176),
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //       'assets/images/bg_riwayat.png'),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(label: res.tglPeriksa ?? ''),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Di periksa oleh :",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.normal,
                                color: const Color(0xff676666),
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  res.namaDokter ?? '',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff676666),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Bagian :",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.normal,
                                color: const Color(0xff676666),
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  res.namaBagian ?? '',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff676666),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 9),
                            Container(
                              height: 1.5,
                              width: 320.0,
                              color: const Color(0xb3e8e7e7),
                              margin: const EdgeInsets.only(bottom: 0),
                            ),
                            const SizedBox(height: 11),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: 90),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;

  const CustomButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xff4babe7),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "Tanggal & jam Periksa : $label",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
