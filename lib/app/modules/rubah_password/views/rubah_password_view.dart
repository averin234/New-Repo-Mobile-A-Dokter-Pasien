import 'package:flutter/material.dart';
import 'package:adokter/app/data/componen/images.dart';
import 'package:adokter/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:text_scroll/text_scroll.dart';

import '../controllers/rubah_password_controller.dart';

class RubahPasswordView extends StatefulWidget {
  const RubahPasswordView({super.key});

  @override
  State<RubahPasswordView> createState() => _RubahPasswordViewState();
}

class _RubahPasswordViewState extends State<RubahPasswordView> {
  final controller = Get.put(RubahPasswordController());
  final RefreshController _refreshController = RefreshController();

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      entries.add(entries.length);
    });
    _refreshController.refreshCompleted();
  }

  List<int> entries = List<int>.generate(5, (int i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9fe),
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          iconSize: 40,
          color: const Color(0xff00AFC1),
          icon: const Icon(Icons.arrow_circle_left_rounded),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => Get.toNamed(Routes.EDIT_PROFILE),
                icon: const Icon(
                  Icons.edit_note_rounded,
                  color: Color(0xff00AFC1),
                  size: 40,
                ),
              ),
              const Text('Edit', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
        title: const Text('Profile Pasien'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 4,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Penting !!',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 13),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextScroll(
                          'Data diri anda terekam di database Rumah Sakit Pluit, Mohon periksa kembali data diri anda, dan lakukan refresh saat melakukan perubahan data diri',
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 11),
                          intervalSpaces: 10,
                          velocity: const Velocity(
                            pixelsPerSecond: Offset(8, 0),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    controller.dataRegist.value.fotoPasien != 'null'
                        ? controller.dataRegist.value.fotoPasien!
                        : controller.dataRegist.value.jenisKelamin == 'L'
                            ? Avatar.lakiLaki
                            : Avatar.perempuan,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.dataRegist.value.namaPasien ?? '',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  controller.dataRegist.value.noKtp ?? '',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 4,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Diri',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email :',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.email ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. HP :',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.noHp ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tgl Lahir',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        (controller.dataRegist.value.tanggalLahir ?? '')
                            .substring(0, 10),
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Umur',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.umur ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tmp Lahir',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.tempatLahir ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alamat',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.alamat ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jenis Kelamin',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.jenisKelamin ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alergi',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.alergi ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Golongan Darah',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.dataRegist.value.golonganDarah ?? '',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
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
    );
  }
}
