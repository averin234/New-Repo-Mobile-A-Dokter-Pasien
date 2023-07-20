import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluitcare/app/data/componen/images.dart';
import 'package:pluitcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:pluitcare/app/modules/profile-view/views/profile_view_view.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/jadwal_praktik.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../routes/app_pages.dart';
import 'dokter_cuti.dart';

class CardListViewPoli extends StatelessWidget {
  final Items items;
  final bool isNoHome;

  const CardListViewPoli(
      {super.key, required this.items, required this.isNoHome});

  @override
  Widget build(BuildContext context) {
    String tag = items.toJson().toString();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: InkWell(
        onTap: () => isNoHome == false
            ? showModalBottomSheet(
                context: context,
                isDismissible: true,
                enableDrag: true,
                useSafeArea: true,
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.99,
                    child: buildSheetklompokjadwal(items: items),
                  );
                },
              )
            : showModalBottomSheet(
                context: context,
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => buildSheet(),
              ),
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x6cc7d1db)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFe0e0e0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(2, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: InkWell(
                  onTap: () => context.pushTransparentRoute(
                    AlertDialog(
                      title: const Text("Profile Dokter"),
                      content: ProfileViewView(
                        src: items.foto!,
                        tag: tag,
                      ),
                    ),
                    backgroundColor: Colors.grey.shade200.withOpacity(0.5),
                    transitionDuration: const Duration(
                      milliseconds: 700,
                    ),
                    reverseTransitionDuration: const Duration(
                      milliseconds: 700,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Hero(
                      tag: tag,
                      child: Image.network(
                        items.foto ?? Avatar.lakiLaki,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Text(
                    //   items.namaPegawai!,
                    //   style: GoogleFonts.nunito(
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black,
                    //     fontSize: 14,
                    //   ),
                    //   textAlign: TextAlign.start,
                    // ),
                    // const SizedBox(height: 5),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: TextScroll(
                    //     items.namaBagian!,
                    //     textDirection: TextDirection.ltr,
                    //     style: GoogleFonts.nunito(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.blue,
                    //       fontSize: 14,
                    //     ),
                    //     intervalSpaces: 10,
                    //     velocity:
                    //         const Velocity(pixelsPerSecond: Offset(10, 0)),
                    //   ),
                    // ),
                    const SizedBox(height: 5),
                    Container(
                        padding: const EdgeInsets.only(
                            right: 0, left: 5, bottom: 15, top: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffDBF6FD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items.namaPegawai!,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: TextScroll(
                                        items.namaBagian!,
                                        textDirection: TextDirection.ltr,
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 14,
                                        ),
                                        intervalSpaces: 10,
                                        velocity: const Velocity(
                                            pixelsPerSecond: Offset(10, 0)),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSheetklompokjadwal({required Items items}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/calendar.png',
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 290,
                        child: Text(
                          items.msgDokter ?? '',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 260,
                        child: Text(
                          items.namaPegawai ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 270,
                        child: Text(
                          items.namaBagian ?? '',
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffecf8ff),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Jadwal Praktik',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            items.jadwal == null
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 100, left: 100),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/nojadwal.png',
                                          height: 150,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ))
                                : Column(
                                    children: items.jadwal!
                                        .map(
                                          (e) => JadwalPraktik(
                                              jadwal: e, items: items),
                                        )
                                        .toList(),
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  const Text(
                      "Anda Belum Terdaftar atau Login di Aplikasi SIRS Rumah Sakit Pluit",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                      "Silahkan daftar atau Login untuk bisa melakukan registrasi poliklinik",
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/login_sukses.png",
                    gaplessPlayback: true,
                    fit: BoxFit.fitHeight,
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 70, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue,
                            ),
                            child: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.greenAccent,
                            ),
                            child: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Login / Regist",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
