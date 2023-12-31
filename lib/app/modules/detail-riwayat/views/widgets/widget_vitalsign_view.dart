import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/model/mr_pasien/detailRiwayat.dart';


class CardVitalSign extends StatelessWidget {
  final VitalSign vitalSign;

  const CardVitalSign({super.key, required this.vitalSign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 230),
                padding: const EdgeInsets.only(top: 20, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFe0e0e0).withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(2, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VITAL SIGN",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Keadaan Umum",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text(
                          vitalSign.keadaanUmum ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Tekanan Darah",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          vitalSign.tekananDarah ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Suhu",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          vitalSign.suhu ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Tinggi Badan",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          vitalSign.tinggiBadan ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Kesadaran",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          vitalSign.kesadaranPasien ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Nadi",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          vitalSign.nadi ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Berat Badan",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          vitalSign.beratBadan ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
