import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/model/mr_pasien/detailRiwayat.dart';

class CardResep extends StatelessWidget {
  final List<Resep> resep;

  const CardResep({
    super.key,
    required this.resep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
              children: resep
                  .map(
                    (e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${e.no}.',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                            Text(
                              e.namaBrg ?? '',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(children: [
                                Text(
                                  "Aturan Pakai",
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 13),
                                ),
                                Text(
                                  e.namaDosis ?? '',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 13),
                                ),
                              ]),
                              Container(
                                height: 30.0,
                                width: 1.0,
                                color: Colors.black,
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                              ),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(children: [
                                      Text(
                                        "Keterangan : ",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        e.ket ?? '',
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 13),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30.0,
                                width: 1.0,
                                color: Colors.black,
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Jumlah : ",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "${e.jumlahPesan} Butir",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Catatan : ",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            Text(
                              e.note ?? '',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
